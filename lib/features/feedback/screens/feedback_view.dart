import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/features/feedback/providers/feedback_provider.dart';
import 'package:lunchbox/i18n/translations.g.dart';

import 'package:lunchbox/features/feedback/widgets/feedback_contact_input.dart';
import 'package:lunchbox/features/feedback/widgets/feedback_description_input.dart';
import 'package:lunchbox/features/feedback/widgets/feedback_header.dart';
import 'package:lunchbox/features/feedback/widgets/feedback_image_upload.dart';
import 'package:lunchbox/features/feedback/widgets/feedback_submit_button.dart';
import 'package:lunchbox/features/feedback/widgets/feedback_type_selector.dart';
import 'package:toastification/toastification.dart';

class FeedbackView extends ConsumerStatefulWidget {
  const FeedbackView({super.key});

  @override
  ConsumerState<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends ConsumerState<FeedbackView> {
  int _selectedTypeIndex = 0;
  final _contentController = TextEditingController();
  final _contactController = TextEditingController();
  List<File> _selectedFiles = [];

  @override
  void dispose() {
    _contentController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  Future<void> _submitFeedback() async {
    final content = _contentController.text.trim();
    final contact = _contactController.text.trim();

    if (content.isEmpty) {
      toastification.show(
        context: context,
        type: ToastificationType.warning,
        title: Text(t.feedback.contentHint),
        autoCloseDuration: const Duration(seconds: 2),
      );
      return;
    }

    final typeLabels = [
      t.feedback.errorReport,
      t.feedback.suggestion,
      t.feedback.complaint,
      t.feedback.other,
    ];
    final type = typeLabels[_selectedTypeIndex];

    // 组合联系方式到内容中（如果后端不支持单独字段）
    final finalContent = contact.isNotEmpty
        ? '$content\n\n联系方式: $contact'
        : content;

    final images = await Future.wait(
      _selectedFiles.map(
        (file) async => await MultipartFile.fromFile(file.path),
      ),
    );

    final success = await ref
        .read(feedbackProvider.notifier)
        .submitFeedback(content: finalContent, type: type, images: images);

    if (mounted) {
      if (success) {
        toastification.show(
          context: context,
          type: ToastificationType.success,
          title: Text(t.feedback.submitSuccess),
          autoCloseDuration: const Duration(seconds: 2),
        );
        Navigator.pop(context);
      } else {
        toastification.show(
          context: context,
          type: ToastificationType.error,
          title: Text(t.feedback.submitFailed),
          autoCloseDuration: const Duration(seconds: 3),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSubmitting = ref.watch(feedbackProvider).isLoading;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(t.feedback.title),
        centerTitle: true,
        backgroundColor:
            theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            const FeedbackHeader(),
            SizedBox(height: 16.h),
            FeedbackTypeSelector(
              selectedIndex: _selectedTypeIndex,
              onTypeSelected: (index) =>
                  setState(() => _selectedTypeIndex = index),
            ),
            SizedBox(height: 16.h),
            FeedbackDescriptionInput(contentController: _contentController),
            SizedBox(height: 16.h),
            FeedbackImageUpload(
              onImagesChanged: (files) =>
                  setState(() => _selectedFiles = files),
            ),
            SizedBox(height: 16.h),
            FeedbackContactInput(controller: _contactController),
            SizedBox(height: 32.h),
            FeedbackSubmitButton(
              onPressed: _submitFeedback,
              isLoading: isSubmitting,
            ),
          ],
        ),
      ),
    );
  }
}
