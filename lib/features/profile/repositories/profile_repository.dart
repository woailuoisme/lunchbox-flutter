import 'package:lunchbox/features/auth/entities/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_repository.g.dart';

@riverpod
class ProfileRepository extends _$ProfileRepository {
  @override
  FutureOr<void> build() {}

  Future<UserModel> getUserInfo() async {
    // 模拟API调用
    await Future<void>.delayed(const Duration(milliseconds: 500));

    return UserModel(
      id: 'mock_user_123',
      username: 'mock_user',
      phone: '13800138000',
      email: 'mock@example.com',
      nickname: '测试用户',
      avatar: 'https://picsum.photos/seed/user/200',
      gender: 'male',
      birthday: DateTime(1990, 1, 1).toIso8601String(),
      points: 100,
      memberLevel: 'gold',
      isVerified: true,
      registeredAt: DateTime(2023, 1, 1).toIso8601String(),
    );
  }

  Future<UserModel> updateUserInfo({
    required UserModel currentUser,
    String? nickname,
    String? avatar,
    String? gender,
    DateTime? birthday,
  }) async {
    // 模拟API调用
    await Future<void>.delayed(const Duration(milliseconds: 500));

    return currentUser.copyWith(
      nickname: nickname ?? currentUser.nickname,
      avatar: avatar ?? currentUser.avatar,
      gender: gender ?? currentUser.gender,
      birthday: birthday?.toIso8601String() ?? currentUser.birthday,
    );
  }
}
