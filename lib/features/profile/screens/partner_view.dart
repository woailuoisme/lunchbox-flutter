import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:lunchbox/features/profile/repositories/partner_repository.dart';
import 'package:timelines_plus/timelines_plus.dart';

class PartnerView extends ConsumerStatefulWidget {
  const PartnerView({super.key});

  @override
  ConsumerState<PartnerView> createState() => _PartnerViewState();
}

class _PartnerViewState extends ConsumerState<PartnerView> {
  final _nameController = TextEditingController();
  final _companyController = TextEditingController();
  final _phoneController = TextEditingController();
  final _intentionController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _companyController.dispose();
    _phoneController.dispose();
    _intentionController.dispose();
    super.dispose();
  }

  Future<void> _submitApplication() async {
    final name = _nameController.text.trim();
    final company = _companyController.text.trim();
    final phone = _phoneController.text.trim();
    final intention = _intentionController.text.trim();

    if (name.isEmpty || company.isEmpty || phone.isEmpty || intention.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请填写完整信息')));
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final success = await ref
          .read(partnerRepositoryProvider.notifier)
          .submitApplication(
            name: name,
            company: company,
            phone: phone,
            intention: intention,
          );

      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('申请提交成功，我们会尽快联系您')));
          _nameController.clear();
          _companyController.clear();
          _phoneController.clear();
          _intentionController.clear();
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('申请提交失败，请稍后重试')));
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('发生错误: $e')));
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('合作商加盟'),
        centerTitle: true,
        backgroundColor:
            theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  _buildAdvantages(context),
                  SizedBox(height: 16.h),
                  _buildProcess(context),
                  SizedBox(height: 16.h),
                  _buildConditions(context),
                  SizedBox(height: 16.h),
                  _buildApplicationForm(context),
                  SizedBox(height: 16.h),
                  _buildContactInfo(context),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 32.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primaryContainer,
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            '合作商加盟',
            style: TextStyle(
              color: theme.colorScheme.onPrimary,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '携手共创美好未来',
            style: TextStyle(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.8),
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdvantages(BuildContext context) {
    final theme = Theme.of(context);
    return _buildSectionCard(
      context: context,
      title: '合作优势',
      children: [
        _buildAdvantageItem(
          Symbols.monetization_on,
          '丰厚收益',
          '提供有竞争力的分成比例，让您的投入获得丰厚回报',
          theme.colorScheme.primary,
          context,
        ),
        _buildAdvantageItem(
          Symbols.security,
          '品牌支持',
          '共享知名品牌资源，享受品牌效应带来的客户信任',
          theme.colorScheme.primary,
          context,
        ),
        _buildAdvantageItem(
          Symbols.trending_up,
          '市场推广',
          '专业的市场推广团队，为您提供全方位的营销支持',
          theme.colorScheme.primary,
          context,
        ),
        _buildAdvantageItem(
          Symbols.school,
          '培训支持',
          '提供专业的培训课程，帮助您快速掌握经营技巧',
          theme.colorScheme.primary,
          context,
        ),
      ],
    );
  }

  Widget _buildAdvantageItem(
    IconData icon,
    String title,
    String desc,
    Color color,
    BuildContext context,
  ) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, color: color, size: 24.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.titleMedium?.color,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  desc,
                  style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProcess(BuildContext context) {
    final theme = Theme.of(context);
    final processes = [
      {'step': '1', 'title': '提交申请', 'desc': '填写合作申请表，提交相关资料'},
      {'step': '2', 'title': '资质审核', 'desc': '我们将在3-5个工作日内完成资质审核'},
      {'step': '3', 'title': '面谈沟通', 'desc': '安排面谈，详细了解合作细节'},
      {'step': '4', 'title': '签署协议', 'desc': '双方达成一致后签署正式合作协议'},
      {'step': '5', 'title': '开始合作', 'desc': '正式启动合作，享受各项支持服务'},
    ];

    return _buildSectionCard(
      context: context,
      title: '合作流程',
      children: [
        FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: theme.colorScheme.primary,
            indicatorTheme: IndicatorThemeData(position: 0, size: 24.w),
            connectorTheme: ConnectorThemeData(
              thickness: 2.w,
              color: theme.dividerColor,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.after,
            itemCount: processes.length,
            contentsBuilder: (context, index) {
              final item = processes[index];
              return Padding(
                padding: EdgeInsets.only(left: 12.w, bottom: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.titleMedium?.color,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      item['desc']!,
                      style: TextStyle(fontSize: 12.sp, color: theme.hintColor),
                    ),
                  ],
                ),
              );
            },
            indicatorBuilder: (context, index) {
              final item = processes[index];
              return DotIndicator(
                color: theme.colorScheme.primary,
                child: Center(
                  child: Text(
                    item['step']!,
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              );
            },
            connectorBuilder: (context, index, type) {
              return SolidLineConnector(color: theme.dividerColor);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildConditions(BuildContext context) {
    final theme = Theme.of(context);
    final conditions = [
      '具有合法的经营资质',
      '有一定的资金实力和经营能力',
      '认同我们的品牌理念和经营模式',
      '具备良好的商业信誉',
      '有相关行业经验者优先',
    ];

    return _buildSectionCard(
      context: context,
      title: '合作条件',
      children: [
        FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: theme.colorScheme.primary,
            indicatorTheme: IndicatorThemeData(position: 0, size: 20.w),
            connectorTheme: ConnectorThemeData(
              thickness: 2.w,
              color: theme.dividerColor,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.after,
            itemCount: conditions.length,
            contentsBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 12.w, bottom: 24.h),
                child: Text(
                  conditions[index],
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                ),
              );
            },
            indicatorBuilder: (context, index) {
              return DotIndicator(
                color: theme.colorScheme.primary,
                child: Icon(
                  Symbols.check,
                  size: 14.sp,
                  color: theme.colorScheme.onPrimary,
                ),
              );
            },
            connectorBuilder: (context, index, type) {
              return SolidLineConnector(color: theme.dividerColor);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildApplicationForm(BuildContext context) {
    final theme = Theme.of(context);
    return _buildSectionCard(
      context: context,
      title: '申请合作',
      children: [
        _buildTextField(context, '姓名', '请输入您的姓名', controller: _nameController),
        SizedBox(height: 12.h),
        _buildTextField(
          context,
          '公司名称',
          '请输入公司名称',
          controller: _companyController,
        ),
        SizedBox(height: 12.h),
        _buildTextField(
          context,
          '联系电话',
          '请输入联系电话',
          controller: _phoneController,
        ),
        SizedBox(height: 12.h),
        _buildTextField(
          context,
          '合作意向',
          '请简述您的合作意向',
          maxLines: 3,
          controller: _intentionController,
        ),
        SizedBox(height: 24.h),
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: ElevatedButton(
            onPressed: _isSubmitting ? null : _submitApplication,
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: _isSubmitting
                ? SizedBox(
                    width: 24.w,
                    height: 24.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation(
                        theme.colorScheme.onPrimary,
                      ),
                    ),
                  )
                : Text(
                    '提交申请',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
    BuildContext context,
    String label,
    String hint, {
    int maxLines = 1,
    TextEditingController? controller,
  }) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: theme.textTheme.titleMedium?.color,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: theme.hintColor),
            filled: true,
            fillColor: theme.colorScheme.surfaceContainerHighest,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Text(
            '联系我们',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: theme.textTheme.titleMedium?.color,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Icon(
                Symbols.phone,
                size: 20.sp,
                color: theme.colorScheme.primary,
              ),
              SizedBox(width: 8.w),
              Text(
                '客服热线: 400-114-8818',
                style: TextStyle(color: theme.textTheme.bodyMedium?.color),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Symbols.location_on,
                size: 20.sp,
                color: theme.colorScheme.primary,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  '地址: 广东省东莞市松山湖园区科汇路1号1栋1510室',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required BuildContext context,
    required String title,
    required List<Widget> children,
  }) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.titleMedium?.color,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4.h, bottom: 16.h),
                width: 32.w,
                height: 3.h,
                color: theme.colorScheme.primary.withValues(alpha: 0.3),
              ),
            ],
          ),
          ...children,
        ],
      ),
    );
  }
}
