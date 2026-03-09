// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lottery_rest_client.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _LotteryRestClient implements LotteryRestClient {
  _LotteryRestClient(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<ApiResponse<List<LotteryPrizeResponse>>> getLotteryPrizes() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponse<List<LotteryPrizeResponse>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/lottery/prizes',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<List<LotteryPrizeResponse>> _value;
    try {
      _value = ApiResponse<List<LotteryPrizeResponse>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<LotteryPrizeResponse>(
                    (i) => LotteryPrizeResponse.fromJson(
                      i as Map<String, dynamic>,
                    ),
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

  @override
  Future<ApiResponse<LotteryDrawResponse>> drawLottery() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponse<LotteryDrawResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/lottery/draw',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<LotteryDrawResponse> _value;
    try {
      _value = ApiResponse<LotteryDrawResponse>.fromJson(
        _result.data!,
        (json) => LotteryDrawResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiResponse<PaginatedResponse<LotteryRecordResponse>>>
  getLotteryRecords({int? page, int? size}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page, r'size': size};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<ApiResponse<PaginatedResponse<LotteryRecordResponse>>>(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/api/v1/lottery/records',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<PaginatedResponse<LotteryRecordResponse>> _value;
    try {
      _value = ApiResponse<PaginatedResponse<LotteryRecordResponse>>.fromJson(
        _result.data!,
        (json) => PaginatedResponse<LotteryRecordResponse>.fromJson(
          json as Map<String, dynamic>,
          (json) =>
              LotteryRecordResponse.fromJson(json as Map<String, dynamic>),
        ),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiResponse<LotteryStatisticsResponse>> getLotteryStatistics() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponse<LotteryStatisticsResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/lottery/statistics',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<LotteryStatisticsResponse> _value;
    try {
      _value = ApiResponse<LotteryStatisticsResponse>.fromJson(
        _result.data!,
        (json) =>
            LotteryStatisticsResponse.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiResponse<LotteryRecordResponse>> getLotteryRecordDetail(
    int recordId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponse<LotteryRecordResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/lottery/records/${recordId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<LotteryRecordResponse> _value;
    try {
      _value = ApiResponse<LotteryRecordResponse>.fromJson(
        _result.data!,
        (json) => LotteryRecordResponse.fromJson(json as Map<String, dynamic>),
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

@ProviderFor(lotteryRestClient)
final lotteryRestClientProvider = LotteryRestClientProvider._();

final class LotteryRestClientProvider
    extends
        $FunctionalProvider<
          LotteryRestClient,
          LotteryRestClient,
          LotteryRestClient
        >
    with $Provider<LotteryRestClient> {
  LotteryRestClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lotteryRestClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lotteryRestClientHash();

  @$internal
  @override
  $ProviderElement<LotteryRestClient> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LotteryRestClient create(Ref ref) {
    return lotteryRestClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LotteryRestClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LotteryRestClient>(value),
    );
  }
}

String _$lotteryRestClientHash() => r'3cadcc1d62f5167b9983b4ebaf360ac23548149f';
