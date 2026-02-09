import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'partner_repository.g.dart';

@riverpod
class PartnerRepository extends _$PartnerRepository {
  @override
  FutureOr<void> build() {}

  Future<bool> submitApplication({
    required String name,
    required String company,
    required String phone,
    required String intention,
  }) async {
    // 模拟提交申请
    await Future<void>.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<Map<String, dynamic>> getPartnerConfig() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return {'hotline': '400-123-4567', 'email': 'partner@lunchbox.com'};
  }
}
