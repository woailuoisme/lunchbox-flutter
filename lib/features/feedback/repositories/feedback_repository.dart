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
    String? contact,
    String? title,
    String? type,
  }) async {
    final response = await _client.submitFeedback({
      'content': content,
      'contact': contact,
      'title': title,
      'type': type,
    });
    return response.success;
  }
}
