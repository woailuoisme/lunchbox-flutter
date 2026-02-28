import 'package:lunchbox/features/partner/datasources/partner_rest_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:lunchbox/core/errors/failure.dart';

part 'partner_repository.g.dart';

@Riverpod(keepAlive: true)
PartnerRepository partnerRepository(Ref ref) {
  return PartnerRepository(ref.watch(partnerRestClientProvider));
}

class PartnerRepository {
  PartnerRepository(this._client);

  final PartnerRestClient _client;

  Future<void> applyPartner(Map<String, dynamic> data) async {
    final response = await _client.applyPartner(data);
    if (!response.success) {
      throw Failure.server(
        message: response.message,
        statusCode: response.code,
      );
    }
  }
}
