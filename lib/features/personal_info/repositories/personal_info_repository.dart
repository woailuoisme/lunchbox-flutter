import 'package:lunchbox/core/errors/repository_error_handler_mixin.dart';
import 'package:lunchbox/core/errors/failure.dart';
import 'package:lunchbox/features/auth/entities/user_model.dart';
import 'package:lunchbox/features/personal_info/datasources/personal_info_rest_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'personal_info_repository.g.dart';

@Riverpod(keepAlive: true)
PersonalInfoRepository personalInfoRepository(Ref ref) {
  return PersonalInfoRepository(ref.watch(personalInfoRestClientProvider));
}

class PersonalInfoRepository with RepositoryErrorHandlerMixin {
  PersonalInfoRepository(this._client);

  final PersonalInfoRestClient _client;

  Future<UserModel> updateProfile(Map<String, dynamic> data) async {
    try {
      final response = await _client.updateProfile(data);
      if (response.success && response.data != null) {
        return response.data!;
      }
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    } catch (e, stack) {
      throw handleError(e, stack);
    }
  }
}
