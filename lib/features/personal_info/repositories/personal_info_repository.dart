import 'package:lunchbox/features/auth/entities/user_model.dart';
import 'package:lunchbox/features/personal_info/datasources/personal_info_rest_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'personal_info_repository.g.dart';

@Riverpod(keepAlive: true)
PersonalInfoRepository personalInfoRepository(Ref ref) {
  return PersonalInfoRepository(ref.watch(personalInfoRestClientProvider));
}

class PersonalInfoRepository {
  PersonalInfoRepository(this._client);

  final PersonalInfoRestClient _client;

  Future<UserModel> updateProfile(Map<String, dynamic> data) async {
    final response = await _client.updateProfile(data);
    return response.data!;
  }
}
