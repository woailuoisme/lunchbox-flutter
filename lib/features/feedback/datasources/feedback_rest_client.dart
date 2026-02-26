import 'package:dio/dio.dart';
import 'package:lunchbox/core/network/dio_provider.dart';
import 'package:lunchbox/core/network/response/api_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_rest_client.g.dart';

@Riverpod(keepAlive: true)
FeedbackRestClient feedbackRestClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return FeedbackRestClient(dio);
}

@RestApi()
abstract class FeedbackRestClient {
  factory FeedbackRestClient(Dio dio, {String baseUrl}) = _FeedbackRestClient;

  /// 提交反馈
  @POST('/api/v1/user/feedback')
  Future<ApiResponse<void>> submitFeedback(@Body() Map<String, dynamic> body);
}
