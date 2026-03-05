import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lunchbox/features/profile/entities/user_profile.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    UserProfile? currentUser,

    @Default(false) bool isLoading,
  }) = _ProfileState;
}
