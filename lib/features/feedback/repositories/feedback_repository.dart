import 'package:lunchbox/core/errors/repository_error_handler_mixin.dart';
import 'package:lunchbox/core/errors/failure.dart';
import 'package:lunchbox/features/feedback/datasources/feedback_rest_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_repository.g.dart';

@Riverpod(keepAlive: true)
FeedbackRepository feedbackRepository(Ref ref) {
  return FeedbackRepository(ref.watch(feedbackRestClientProvider));
}

class FeedbackRepository with RepositoryErrorHandlerMixin {
  FeedbackRepository(this._client);

  final FeedbackRestClient _client;

  Future<void> submitFeedback({
    required String content,
    String? contact,
    String? title,
    String? type,
  }) async {
    try {
      final response = await _client.submitFeedback({
        'content': content,
        'contact': contact,
        'title': title,
        'type': type,
      });
      if (!response.success) {
        throw Failure.server(
          message: response.message,
          statusCode: response.code,
        );
      }
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }
}
