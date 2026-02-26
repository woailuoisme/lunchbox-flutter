import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:lunchbox/features/feedback/repositories/feedback_repository.dart';
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
            _buildHeader(context),
            SizedBox(height: 16.h),
            _buildTypeSelection(context),
            SizedBox(height: 16.h),
            _buildDescriptionInput(context),
            SizedBox(height: 16.h),
            _buildImageUpload(context),
            SizedBox(height: 16.h),
            _buildContactInput(context),
            SizedBox(height: 32.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _submitFeedback,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
                child: _isSubmitting
                    ? SizedBox(
                        width: 24.w,
                        height: 24.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: theme.colorScheme.onPrimary,
                        ),
                      )
                    : Text(
                        t.feedback.submit,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          Icon(
            Symbols.edit_note,
            size: 48.sp,
            color: theme.colorScheme.primary.withValues(alpha: 0.7),
          ),
          SizedBox(height: 8.h),
          Text(
            t.feedback.title,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.h),
          Text(
            t.feedback.subtitle,
            style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeSelection(BuildContext context) {
    final theme = Theme.of(context);
    final List<Map<String, dynamic>> types = [
      {
        'icon': Symbols.block,
        'label': t.feedback.errorReport,
        'color': theme.colorScheme.error,
      },
      {
        'icon': Symbols.lightbulb,
        'label': t.feedback.suggestion,
        'color': theme.colorScheme.tertiary,
      },
      {
        'icon': Symbols.sentiment_dissatisfied,
        'label': t.feedback.complaint,
        'color': theme.colorScheme.secondary,
      },
      {
        'icon': Symbols.help,
        'label': t.feedback.other,
        'color': theme.colorScheme.primary,
      },
    ];

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.feedback.selectType,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.w,
              crossAxisSpacing: 16.w,
              childAspectRatio: 2.5,
            ),
            itemCount: types.length,
            itemBuilder: (context, index) {
              final type = types[index];
              final isSelected = _selectedTypeIndex == index;
              return InkWell(
                onTap: () => setState(() => _selectedTypeIndex = index),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? theme.colorScheme.primaryContainer.withValues(
                            alpha: 0.3,
                          )
                        : theme.colorScheme.surfaceContainerHighest.withValues(
                            alpha: 0.3,
                          ),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: isSelected
                          ? theme.colorScheme.primary
                          : Colors.transparent,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        type['icon'] as IconData,
                        color: type['color'] as Color,
                        size: 20.sp,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        type['label'] as String,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: theme.textTheme.bodyMedium?.color,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionInput(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.feedback.description,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.h),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: t.feedback.titleHint,
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.3,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          TextField(
            controller: _contentController,
            maxLines: 5,
            maxLength: 500,
            decoration: InputDecoration(
              hintText: t.feedback.contentHint,
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.3,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.all(16.w),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageUpload(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.feedback.uploadScreenshot,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.h),
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.3,
              ),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: theme.dividerColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Symbols.add, color: theme.hintColor),
                SizedBox(height: 4.h),
                Text(
                  t.feedback.addImage,
                  style: TextStyle(fontSize: 10.sp, color: theme.hintColor),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            t.feedback.uploadLimitHint,
            style: TextStyle(fontSize: 10.sp, color: theme.hintColor),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInput(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.feedback.contactOptional,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.h),
          TextField(
            controller: _contactController,
            decoration: InputDecoration(
              hintText: t.feedback.contactInputHint,
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.3,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
