import 'dart:async';
import 'package:dio/dio.dart';
import 'package:lunchbox/features/feedback/repositories/feedback_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_provider.g.dart';

@riverpod
class FeedbackNotifier extends _$FeedbackNotifier {
  @override
  FutureOr<void> build() {
    // 初始状态
  }

  /// 提交反馈
  Future<bool> submitFeedback({
    required String content,
    required String type,
    List<MultipartFile>? images,
  }) async {
    state = const AsyncLoading();

    final repository = ref.read(feedbackRepositoryProvider);
    final result = await AsyncValue.guard(
      () => repository.submitFeedback(
        content: content,
        type: type,
        images: images,
      ),
    );

    if (result.hasError) {
      state = AsyncError(result.error!, result.stackTrace!);
      return false;
    }

    state = const AsyncData(null);
    return result.value ?? false;
  }
}
