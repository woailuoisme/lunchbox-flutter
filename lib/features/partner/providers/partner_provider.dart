import 'package:lunchbox/features/partner/entities/partner_consult_request.dart';
import 'package:lunchbox/features/partner/repositories/partner_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'partner_provider.g.dart';

@riverpod
class PartnerNotifier extends _$PartnerNotifier {
  @override
  FutureOr<void> build() {
    // 初始状态
  }

  /// 提交合作咨询信息
  Future<bool> submitConsult({
    required String name,
    required String phone,
    required String company,
    required String message,
  }) async {
    state = const AsyncLoading();
    bool success = false;

    state = await AsyncValue.guard(() async {
      final repository = ref.read(partnerRepositoryProvider);
      final request = PartnerConsultRequest(
        name: name,
        phone: phone,
        company: company,
        message: message,
      );
      await repository.submitConsult(request);
      success = true;
    });

    return success;
  }
}
