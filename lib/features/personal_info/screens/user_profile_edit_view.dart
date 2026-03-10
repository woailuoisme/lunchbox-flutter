import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lunchbox/features/personal_info/providers/personal_info_provider.dart';
import 'package:lunchbox/features/profile/providers/profile_provider.dart';
import 'package:lunchbox/features/personal_info/widgets/profile_avatar_edit.dart';
import 'package:lunchbox/features/personal_info/widgets/profile_info_card.dart';
import 'package:lunchbox/features/personal_info/widgets/profile_info_tile.dart';
import 'package:lunchbox/features/personal_info/widgets/profile_edit_save_button.dart';
import 'package:lunchbox/features/personal_info/widgets/gender_picker_sheet.dart';
import 'package:lunchbox/features/personal_info/widgets/profile_edit_dialog.dart';
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
  final _nicknameController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _selectedGender;
  DateTime? _selectedBirthday;
  File? _selectedAvatarFile;
  bool _isInitialized = false;

  @override
  void dispose() {
    _nicknameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _initializeData() {
    if (_isInitialized) return;

    final state = ref.read(profileProvider);
    final user = state.value?.currentUser;

    if (user != null) {
      _nicknameController.text = user.nickname;
      _phoneController.text = user.telephone ?? '';
      _selectedGender = user.gender;

      if (user.birthday != null && user.birthday!.isNotEmpty) {
        try {
          _selectedBirthday = DateTime.parse(user.birthday!);
        } catch (_) {}
      }
      _isInitialized = true;
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxWidth: 1000,
    );

    if (image != null) {
      setState(() {
        _selectedAvatarFile = File(image.path);
      });
    }
  }

  Future<void> _saveProfile() async {
    final nickname = _nicknameController.text.trim();
    final telephone = _phoneController.text.trim();

    if (nickname.isEmpty) {
      toastification.show(
        context: context,
        title: Text(t.auth.nickname + t.profile.info.notSet),
        type: ToastificationType.warning,
      );
      return;
    }

    final success = await ref
        .read(personalInfoProvider.notifier)
        .updateProfile(
          nickname: nickname,
          gender: _selectedGender ?? 'unknown',
          telephone: telephone,
          avatar: _selectedAvatarFile,
        );

    if (success && mounted) {
      toastification.show(
        context: context,
        title: Text(t.common.success),
        description: Text(t.profile.saveSuccess),
        type: ToastificationType.success,
        autoCloseDuration: const Duration(seconds: 2),
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    _initializeData();

    final state = ref.watch(profileProvider);
    final updateState = ref.watch(personalInfoProvider);
    final user = state.value?.currentUser;
    final theme = Theme.of(context);
    final isUpdating = updateState is AsyncLoading;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(t.profile.personalInfo),
        centerTitle: true,
        elevation: 0,
        backgroundColor: theme.colorScheme.surface.withValues(alpha: 0.8),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: user == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                // 顶部背景渐变
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 250.h,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          theme.colorScheme.primaryContainer.withValues(
                            alpha: 0.5,
                          ),
                          theme.colorScheme.surface.withValues(alpha: 0),
                        ],
                      ),
                    ),
                  ),
                ),

                // 主滚动区域
                Positioned.fill(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 56.h,
                      bottom: 110.h,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        ProfileAvatarEdit(
                          avatarUrl:
                              user.avatar ??
                              'https://picsum.photos/seed/user/200',
                          localImage: _selectedAvatarFile,
                          changeLabel: t.profile.avatar.clickToChange,
                          isLoading: isUpdating,
                          onTap: _pickImage,
                        ),
                        SizedBox(height: 32.h),

                        // 基本信息
                        ProfileInfoCard(
                          title: t.profile.info.basic,
                          children: [
                            ProfileInfoTile(
                              icon: Symbols.person,
                              label: t.auth.nickname,
                              value: _nicknameController.text.isEmpty
                                  ? t.profile.info.notSet
                                  : _nicknameController.text,
                              onTap: () => _showEditNicknameDialog(context),
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
                              icon: Symbols.phone_android,
                              label: t.profile.info.phone,
                              value: _phoneController.text.isEmpty
                                  ? t.profile.info.notSet
                                  : _maskPhone(_phoneController.text),
                              onTap: () => _showEditPhoneDialog(context),
                            ),
                          ],
                        ),

                        // 更多信息
                        ProfileInfoCard(
                          title: t.profile.info.other,
                          children: [
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
                            _buildDivider(context),
                            ProfileInfoTile(
                              icon: Symbols.mail,
                              label: t.profile.info.email,
                              value: (user.email == null || user.email!.isEmpty)
                                  ? t.profile.info.notSet
                                  : user.email!,
                              isEditable: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // 底部固定保存按钮
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ProfileEditSaveButton(
                    onPressed: _saveProfile,
                    isLoading: isUpdating,
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 56.w, right: 16.w),
      child: Divider(
        height: 1.h,
        thickness: 0.5,
        color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
      ),
    );
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

  String _maskPhone(String phone) {
    if (phone.length < 7) return phone;
    return phone.replaceRange(3, 7, '****');
  }

  void _showEditNicknameDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => ProfileEditDialog(
        title: t.common.edit + t.auth.nickname,
        initialValue: _nicknameController.text,
        hintText: t.auth.enterNickname,
        onConfirm: (value) => setState(() => _nicknameController.text = value),
      ),
    );
  }

  void _showEditPhoneDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => ProfileEditDialog(
        title: t.common.edit + t.profile.info.phone,
        initialValue: _phoneController.text,
        hintText: t.auth.enterPhoneNumber,
        keyboardType: TextInputType.phone,
        onConfirm: (value) => setState(() => _phoneController.text = value),
      ),
    );
  }

  void _showGenderPicker(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => GenderPickerSheet(
        selectedGender: _selectedGender,
        onSelected: (value) => setState(() => _selectedGender = value),
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: _selectedBirthday ?? DateTime(1995, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((picked) {
      if (picked != null) {
        setState(() => _selectedBirthday = picked);
      }
    });
  }
}
