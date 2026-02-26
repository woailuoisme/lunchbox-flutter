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

  Future<void> submitFeedback({
    required String content,
    String? contact,
    String? title,
    String? type,
  }) async {
    await _client.submitFeedback({
      'content': content,
      'contact': contact,
      'title': title,
      'type': type,
    });
  }
}
