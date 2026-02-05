import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lunchbox/features/profile/providers/profile_notifier.dart';
import 'package:lunchbox/features/profile/providers/profile_state.dart';
import 'package:toastification/toastification.dart';

/// 个人信息编辑视图
class ProfileEditView extends ConsumerStatefulWidget {
  const ProfileEditView({super.key});

  @override
  ConsumerState<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends ConsumerState<ProfileEditView> {
  late TextEditingController nicknameController;

  @override
  void initState() {
    super.initState();
    nicknameController = TextEditingController();
  }

  @override
  void dispose() {
    nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileProvider);
    final notifier = ref.read(profileProvider.notifier);

    // 初始化表单数据
    if (nicknameController.text.isEmpty && state.currentUser != null) {
      nicknameController.text = state.currentUser!.nickname;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('编辑资料'),
        actions: [
          TextButton(
            onPressed: () {
              notifier.updateUserInfo(nickname: nicknameController.text);
              context.pop();
            },
            child: const Text('保存'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24.h),

            // 头像
            _buildAvatarSection(context, state),

            SizedBox(height: 24.h),

            // 表单
            ColoredBox(
              color: Colors.white,
              child: Column(
                children: [
                  _buildFormField(
                    label: '昵称',
                    controller: nicknameController,
                    hint: '请输入昵称',
                  ),
                  _buildDivider(),
                  _buildInfoRow(
                    label: '用户名',
                    value: state.currentUser?.username ?? '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建信息行（只读）
  Widget _buildInfoRow({required String label, required String value}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          SizedBox(
            width: 80.w,
            child: Text(
              label,
              style: TextStyle(fontSize: 15.sp, color: Colors.black87),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 15.sp, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }

  /// 构建头像区域
  Widget _buildAvatarSection(BuildContext context, ProfileState state) {
    final user = state.currentUser;

    return GestureDetector(
      onTap: () {
        toastification.show(
          context: context,
          title: const Text('头像上传功能开发中'),
          type: ToastificationType.info,
          autoCloseDuration: const Duration(seconds: 2),
        );
      },
      child: Column(
        children: [
          Stack(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey[300]!, width: 2),
                ),
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: user?.avatar != null
                      ? CachedNetworkImageProvider(user!.avatar!)
                      : null,
                  child: user?.avatar == null
                      ? Icon(Icons.person, size: 50.sp, color: Colors.grey)
                      : null,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    size: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            '点击更换头像',
            style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  /// 构建表单字段
  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required String hint,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          SizedBox(
            width: 80.w,
            child: Text(
              label,
              style: TextStyle(fontSize: 15.sp, color: Colors.black87),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 15.sp, color: Colors.grey[400]),
              ),
              style: TextStyle(fontSize: 15.sp),
            ),
          ),
        ],
      ),
    );
  }

  /// 构建分割线
  Widget _buildDivider() {
    return Divider(height: 1.h, indent: 96.w, endIndent: 16.w);
  }
}
