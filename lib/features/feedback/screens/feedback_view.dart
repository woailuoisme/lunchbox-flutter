import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';

import 'package:lunchbox/features/feedback/repositories/feedback_repository.dart';
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
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _contactController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  Future<void> _submitFeedback() async {
    final title = _titleController.text.trim();
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

    setState(() => _isSubmitting = true);

    try {
      final typeLabels = [
        t.feedback.errorReport,
        t.feedback.suggestion,
        t.feedback.complaint,
        t.feedback.other,
      ];
      final type = typeLabels[_selectedTypeIndex];

      await ref
          .read(feedbackRepositoryProvider)
          .submitFeedback(
            content: content,
            contact: contact,
            title: title,
            type: type,
          );
      if (mounted) {
        toastification.show(
          context: context,
          type: ToastificationType.success,
          title: Text(t.feedback.submitSuccess),
          autoCloseDuration: const Duration(seconds: 2),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        toastification.show(
          context: context,
          type: ToastificationType.error,
          title: Text('${t.feedback.submitFailed}: $e'),
          autoCloseDuration: const Duration(seconds: 3),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            FeedbackDescriptionInput(
              titleController: _titleController,
              contentController: _contentController,
            ),
            SizedBox(height: 16.h),
            const FeedbackImageUpload(),
            SizedBox(height: 16.h),
            FeedbackContactInput(controller: _contactController),
            SizedBox(height: 32.h),
            FeedbackSubmitButton(
              onPressed: _submitFeedback,
              isLoading: _isSubmitting,
            ),
          ],
        ),
      ),
    );
  }
}
