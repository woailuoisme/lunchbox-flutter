// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_rest_client.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _PointsRestClient implements PointsRestClient {
  _PointsRestClient(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<ApiResponse<PaginatedResponse<MallProductResponse>>>
  getRedemptionItems({int? page, String? type}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page, r'type': type};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiResponse<PaginatedResponse<MallProductResponse>>>(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/api/v1/redemption/items',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<PaginatedResponse<MallProductResponse>> _value;
    try {
      _value = ApiResponse<PaginatedResponse<MallProductResponse>>.fromJson(
        _result.data!,
        (json) => PaginatedResponse<MallProductResponse>.fromJson(
          json as Map<String, dynamic>,
          (json) => MallProductResponse.fromJson(json as Map<String, dynamic>),
        ),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiResponse<dynamic>> redeemItem(int id) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponse<dynamic>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/redemption/redeem/${id}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<dynamic> _value;
    try {
      _value = ApiResponse<dynamic>.fromJson(
        _result.data!,
        (json) => json as dynamic,
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiResponse<PaginatedResponse<PointsRecordResponse>>>
  getRedemptionHistory({int? page, String? type}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page, r'type': type};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiResponse<PaginatedResponse<PointsRecordResponse>>>(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/api/v1/redemption/history',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<PaginatedResponse<PointsRecordResponse>> _value;
    try {
      _value = ApiResponse<PaginatedResponse<PointsRecordResponse>>.fromJson(
        _result.data!,
        (json) => PaginatedResponse<PointsRecordResponse>.fromJson(
          json as Map<String, dynamic>,
          (json) => PointsRecordResponse.fromJson(json as Map<String, dynamic>),
        ),
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

@ProviderFor(pointsRestClient)
final pointsRestClientProvider = PointsRestClientProvider._();

final class PointsRestClientProvider
    extends
        $FunctionalProvider<
          PointsRestClient,
          PointsRestClient,
          PointsRestClient
        >
    with $Provider<PointsRestClient> {
  PointsRestClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pointsRestClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pointsRestClientHash();

  @$internal
  @override
  $ProviderElement<PointsRestClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PointsRestClient create(Ref ref) {
    return pointsRestClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PointsRestClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PointsRestClient>(value),
    );
  }
}

String _$pointsRestClientHash() => r'307959bda0af1b0a3dbd22ffb4d95dbef2891e41';
