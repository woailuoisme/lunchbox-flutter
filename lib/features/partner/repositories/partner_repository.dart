import 'package:lunchbox/features/partner/datasources/partner_rest_client.dart';
import 'package:lunchbox/features/partner/entities/partner_consult_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'partner_repository.g.dart';

@Riverpod(keepAlive: true)
PartnerRepository partnerRepository(Ref ref) {
  return PartnerRepository(ref.watch(partnerRestClientProvider));
}

class PartnerRepository {
  PartnerRepository(this._client);

  final PartnerRestClient _client;

  /// 提交合作咨询信息
  Future<void> submitConsult(PartnerConsultRequest request) async {
    await _client.submitConsult(request);
  }
}
