// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_coupons_rest_client.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _MyCouponsRestClient implements MyCouponsRestClient {
  _MyCouponsRestClient(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<ApiResponse<List<UserCouponModel>>> getUserCoupons({
    String? category,
    String? type,
    String? usedType,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'category': category,
      r'type': type,
      r'used_type': usedType,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponse<List<UserCouponModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/user/coupons',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<List<UserCouponModel>> _value;
    try {
      _value = ApiResponse<List<UserCouponModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<UserCouponModel>(
                    (i) => UserCouponModel.fromJson(i as Map<String, dynamic>),
                  )
                  .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(myCouponsRestClient)
final myCouponsRestClientProvider = MyCouponsRestClientProvider._();

final class MyCouponsRestClientProvider
    extends
        $FunctionalProvider<
          MyCouponsRestClient,
          MyCouponsRestClient,
          MyCouponsRestClient
        >
    with $Provider<MyCouponsRestClient> {
  MyCouponsRestClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myCouponsRestClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myCouponsRestClientHash();

  @$internal
  @override
  $ProviderElement<MyCouponsRestClient> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MyCouponsRestClient create(Ref ref) {
    return myCouponsRestClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MyCouponsRestClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MyCouponsRestClient>(value),
    );
  }
}

String _$myCouponsRestClientHash() =>
    r'007b2a0fda6e6084d08ff7e5f2d2efbf05087871';
