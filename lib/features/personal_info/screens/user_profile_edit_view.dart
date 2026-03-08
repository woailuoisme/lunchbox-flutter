import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lunchbox/features/personal_info/repositories/personal_info_repository.dart';
import 'package:lunchbox/features/profile/providers/profile_provider.dart';
import 'package:lunchbox/features/personal_info/widgets/profile_avatar_edit.dart';
import 'package:lunchbox/features/personal_info/widgets/profile_info_card.dart';
import 'package:lunchbox/features/personal_info/widgets/profile_info_tile.dart';
import 'package:lunchbox/i18n/translations.g.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:toastification/toastification.dart';

/// 个人信息编辑视图
class ProfileEditView extends ConsumerStatefulWidget {
  const ProfileEditView({super.key});

  @override
  ConsumerState<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends ConsumerState<ProfileEditView> {
  // 临时存储编辑状态
  String? _selectedGender;
  DateTime? _selectedBirthday;

  Future<void> _saveProfile() async {
    final user = ref.read(profileProvider).value?.currentUser;
    if (user == null) return;

    try {
      final repository = ref.read(personalInfoRepositoryProvider);
      final updatedUser = await repository.updateProfile(
        nickname: user.nickname,
        gender: _selectedGender ?? user.gender,
        telephone: user.telephone ?? '',
        // birthday: _selectedBirthday?.toIso8601String(), // API 暂时不支持 birthday
      );

      // Update profile state
      ref.invalidate(profileProvider);

      if (mounted) {
        toastification.show(
          context: context,
          title: Text(t.profile.saveSuccess),
          type: ToastificationType.success,
          autoCloseDuration: const Duration(seconds: 2),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        toastification.show(
          context: context,
          title: Text(t.profile.saveFailed(error: e.toString())),
          type: ToastificationType.error,
          autoCloseDuration: const Duration(seconds: 2),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileProvider);
    final user = state.value?.currentUser;
    final theme = Theme.of(context);

    // 初始化本地状态（如果未初始化）
    if (user != null) {
      _selectedGender ??= user.gender;
      if (_selectedBirthday == null &&
          user.birthday != null &&
          user.birthday!.isNotEmpty) {
        try {
          _selectedBirthday = DateTime.parse(user.birthday!);
        } catch (_) {
          // 忽略解析错误
        }
      }
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(t.profile.personalInfo),
        centerTitle: true,
        backgroundColor:
            theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface,
        elevation: 0,
        actions: [],
      ),
      body: user == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 32.h),
                        // 头像区域
                        ProfileAvatarEdit(
                          avatarUrl:
                              user.avatar ??
                              'https://picsum.photos/seed/user/200',
                          changeLabel: t.profile.avatar.clickToChange,
                          onTap: () {
                            toastification.show(
                              context: context,
                              title: Text(t.profile.avatar.uploading),
                              type: ToastificationType.info,
                              autoCloseDuration: const Duration(seconds: 2),
                            );
                          },
                        ),
                        SizedBox(height: 32.h),

                        // 基本信息卡片
                        ProfileInfoCard(
                          title: t.profile.info.basic,
                          children: [
                            ProfileInfoTile(
                              icon: Symbols.phone_android,
                              label: t.profile.info.phone,
                              value: _maskPhoneNumber(user.telephone ?? ''),
                              isEditable: false,
                            ),
                            _buildDivider(context),
                            ProfileInfoTile(
                              icon: Symbols.wc,
                              label: t.profile.info.gender,
                              value: _getGenderLabel(_selectedGender),
                              onTap: () => _showGenderPicker(context),
                            ),
                            _buildDivider(context),
                            ProfileInfoTile(
                              icon: Symbols.cake,
                              label: t.profile.info.birthday,
                              value: _selectedBirthday != null
                                  ? DateFormat(
                                      'yyyy-MM-dd',
                                    ).format(_selectedBirthday!)
                                  : t.profile.info.notSet,
                              onTap: () => _showDatePicker(context),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),

                        // 其他信息卡片
                        ProfileInfoCard(
                          title: t.profile.info.other,
                          children: [
                            ProfileInfoTile(
                              icon: Symbols.mail,
                              label: t.profile.info.email,
                              value: user.email ?? 'user@example.com',
                              isEditable: false, // 假设邮箱不可编辑或需要特定流程
                            ),
                          ],
                        ),
                        SizedBox(height: 32.h),
                      ],
                    ),
                  ),
                ),
                // 底部保存按钮
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: theme.shadowColor.withValues(alpha: 0.05),
                        offset: const Offset(0, -2),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // 保存逻辑
                        // TODO: 调用 API 更新性别和生日
                        toastification.show(
                          context: context,
                          title: Text(t.profile.saveSuccess),
                          type: ToastificationType.success,
                          autoCloseDuration: const Duration(seconds: 2),
                        );
                        context.pop();
                      },
                      icon: Icon(
                        Symbols.save,
                        color: theme.colorScheme.onPrimary,
                      ),
                      label: Text(
                        t.profile.saveInfo,
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    final theme = Theme.of(context);
    return Divider(
      height: 1.h,
      thickness: 1.h,
      indent: 48.w,
      endIndent: 16.w,
      color: theme.dividerColor,
    );
  }

  String _maskPhoneNumber(String phone) {
    if (phone.length < 7) {
      return phone;
    }
    return '${phone.substring(0, 3)}****${phone.substring(phone.length - 4)}';
  }

  String _getGenderLabel(String? gender) {
    switch (gender) {
      case 'male':
        return t.profile.gender.male;
      case 'female':
        return t.profile.gender.female;
      default:
        return t.profile.gender.unknown;
    }
  }

  void _showGenderPicker(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildGenderOption(t.profile.gender.male, 'male'),
              _buildGenderOption(t.profile.gender.female, 'female'),
              _buildGenderOption(t.profile.gender.unknown, 'unknown'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGenderOption(String label, String value) {
    return ListTile(
      title: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16.sp),
      ),
      onTap: () {
        setState(() {
          _selectedGender = value;
        });
        Navigator.pop(context);
      },
    );
  }

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: _selectedBirthday ?? DateTime(1990),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('zh'),
    ).then((picked) {
      if (picked != null) {
        setState(() {
          _selectedBirthday = picked;
        });
      }
    });
  }
}
