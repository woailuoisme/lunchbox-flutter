import 'package:dio/dio.dart';
import 'package:lunchbox/features/feedback/datasources/feedback_rest_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_repository.g.dart';

@Riverpod(keepAlive: true)
FeedbackRepository feedbackRepository(Ref ref) {
  return FeedbackRepository(ref.watch(feedbackRestClientProvider));
}

class FeedbackRepository {
  FeedbackRepository(this._client);

  final FeedbackRestClient _client;

  /// 提交反馈
  Future<bool> submitFeedback({
    required String content,
    required String type,
    List<MultipartFile>? images,
  }) async {
    final response = await _client.submitFeedback(
      content: content,
      type: type,
      images: images,
    );
    return response.success;
  }
}
