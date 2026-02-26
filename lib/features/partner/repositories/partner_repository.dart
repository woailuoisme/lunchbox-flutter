import 'package:lunchbox/features/partner/datasources/partner_rest_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'partner_repository.g.dart';

@Riverpod(keepAlive: true)
PartnerRepository partnerRepository(Ref ref) {
  return PartnerRepository(ref.watch(partnerRestClientProvider));
}

class PartnerRepository {
  PartnerRepository(this._client);

  final PartnerRestClient _client;

  Future<void> applyPartner(Map<String, dynamic> data) async {
    await _client.applyPartner(data);
  }
}
