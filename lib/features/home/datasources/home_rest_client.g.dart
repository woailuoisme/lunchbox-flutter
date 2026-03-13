// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_rest_client.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _HomeRestClient implements HomeRestClient {
  _HomeRestClient(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<ApiResponse<List<BannerModel>>> getBanners({
    String type = 'first',
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'type': type};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponse<List<BannerModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/home/carousels',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<List<BannerModel>> _value;
    try {
      _value = ApiResponse<List<BannerModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<BannerModel>(
                    (i) => BannerModel.fromJson(i as Map<String, dynamic>),
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
  Future<ApiResponse<NearestDeviceModel>> getNearestDevice({
    required double latitude,
    required double longitude,
    int limit = 1,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'latitude': latitude,
      r'longitude': longitude,
      r'limit': limit,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponse<NearestDeviceModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/home/nearest_device',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<NearestDeviceModel> _value;
    try {
      _value = ApiResponse<NearestDeviceModel>.fromJson(
        _result.data!,
        (json) => NearestDeviceModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiResponse<List<RecommendProductModel>>> getRecommendProducts({
    List<String>? tags,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'tags[]': tags};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponse<List<RecommendProductModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/home/recommend_products',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<List<RecommendProductModel>> _value;
    try {
      _value = ApiResponse<List<RecommendProductModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<RecommendProductModel>(
                    (i) => RecommendProductModel.fromJson(
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

@ProviderFor(homeRestClient)
final homeRestClientProvider = HomeRestClientProvider._();

final class HomeRestClientProvider
    extends $FunctionalProvider<HomeRestClient, HomeRestClient, HomeRestClient>
    with $Provider<HomeRestClient> {
  HomeRestClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeRestClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeRestClientHash();

  @$internal
  @override
  $ProviderElement<HomeRestClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeRestClient create(Ref ref) {
    return homeRestClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeRestClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeRestClient>(value),
    );
  }
}

String _$homeRestClientHash() => r'c40bfb10b85c32b1a02bad64b2263e8ac2d4f3d3';
