import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lunchbox/features/personal_info/repositories/personal_info_repository.dart';
import 'package:lunchbox/features/profile/providers/profile_provider.dart';
import 'package:lunchbox/features/profile/providers/profile_state.dart';
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
    try {
      final repository = ref.read(personalInfoRepositoryProvider);
      final updatedUser = await repository.updateProfile({
        'gender': _selectedGender,
        'birthday': _selectedBirthday?.toIso8601String(),
      });

      // Update profile state
      // We assume ProfileNotifier can be refreshed or has a way to set user.
      // Since it doesn't have setUser, we call loadUserInfo which fetches from repo.
      // But repo in profile module might not have the new data if it's mocked or different.
      // Ideally, ProfileNotifier should listen to changes or we invalidate it.
      ref.invalidate(profileProvider);

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(t.profile.saveSuccess)));
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.profile.saveFailed(error: e.toString()))),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileProvider);
    final user = state.currentUser;
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
                        _buildAvatarSection(context, state),
                        SizedBox(height: 32.h),

                        // 基本信息卡片
                        _buildInfoCard(
                          context: context,
                          title: t.profile.info.basic,
                          children: [
                            _buildInfoTile(
                              context: context,
                              icon: Symbols.phone_android,
                              label: t.profile.info.phone,
                              value: _maskPhoneNumber(user.phone ?? ''),
                              isEditable: false,
                            ),
                            _buildDivider(context),
                            _buildInfoTile(
                              context: context,
                              icon: Symbols.wc,
                              label: t.profile.info.gender,
                              value: _getGenderLabel(_selectedGender),
                              onTap: () => _showGenderPicker(context),
                            ),
                            _buildDivider(context),
                            _buildInfoTile(
                              context: context,
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
                        _buildInfoCard(
                          context: context,
                          title: t.profile.info.other,
                          children: [
                            _buildInfoTile(
                              context: context,
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

  Widget _buildAvatarSection(BuildContext context, ProfileState state) {
    final user = state.currentUser;
    final theme = Theme.of(context);
    return Center(
      child: GestureDetector(
        onTap: () {
          toastification.show(
            context: context,
            title: Text(t.profile.avatar.uploading),
            type: ToastificationType.info,
            autoCloseDuration: const Duration(seconds: 2),
          );
        },
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 100.r,
                  height: 100.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: theme.colorScheme.surface,
                      width: 4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: theme.shadowColor.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    image: DecorationImage(
                      image: NetworkImage(
                        user?.avatar ?? 'https://picsum.photos/seed/user/200',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Symbols.camera_alt,
                      size: 16.sp,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              t.profile.avatar.clickToChange,
              style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required BuildContext context,
    required String title,
    required List<Widget> children,
  }) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Container(
                  width: 4.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.titleMedium?.color,
                  ),
                ),
              ],
            ),
          ),
          ...children,
          SizedBox(height: 8.h),
        ],
      ),
    );
  }

  Widget _buildInfoTile({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
    bool isEditable = true,
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: isEditable ? onTap : null,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          children: [
            Icon(icon, size: 20.sp, color: theme.colorScheme.primary),
            SizedBox(width: 12.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 15.sp,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
            const Spacer(),
            Text(
              value,
              style: TextStyle(fontSize: 15.sp, color: theme.hintColor),
            ),
            if (isEditable) ...[
              SizedBox(width: 4.w),
              Icon(Symbols.chevron_right, size: 20.sp, color: theme.hintColor),
            ],
          ],
        ),
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
