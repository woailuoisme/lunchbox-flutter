import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/auth/entities/user_model.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    UserModel? currentUser,

    @Default(false) bool isLoading,
  }) = _ProfileState;
}
