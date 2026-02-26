// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_rest_client.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _DeviceRestClient implements DeviceRestClient {
  _DeviceRestClient(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<ApiResponse<List<CityModel>>> getEnableCities() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponse<List<CityModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/home/enable_cities',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<List<CityModel>> _value;
    try {
      _value = ApiResponse<List<CityModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<CityModel>(
                    (i) => CityModel.fromJson(i as Map<String, dynamic>),
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
  Future<ApiResponse<List<DeviceModel>>> getDevicesWithDistance({
    String? cityCode,
    double? latitude,
    double? longitude,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'city_code': cityCode,
      r'latitude': latitude,
      r'longitude': longitude,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponse<List<DeviceModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/home/devices_with_distance',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<List<DeviceModel>> _value;
    try {
      _value = ApiResponse<List<DeviceModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<DeviceModel>(
                    (i) => DeviceModel.fromJson(i as Map<String, dynamic>),
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
  Future<ApiResponse<List<DeviceModel>>> getFrequentDevices() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponse<List<DeviceModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/home/frequent_devices',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<List<DeviceModel>> _value;
    try {
      _value = ApiResponse<List<DeviceModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<DeviceModel>(
                    (i) => DeviceModel.fromJson(i as Map<String, dynamic>),
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

@ProviderFor(deviceRestClient)
final deviceRestClientProvider = DeviceRestClientProvider._();

final class DeviceRestClientProvider
    extends
        $FunctionalProvider<
          DeviceRestClient,
          DeviceRestClient,
          DeviceRestClient
        >
    with $Provider<DeviceRestClient> {
  DeviceRestClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceRestClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceRestClientHash();

  @$internal
  @override
  $ProviderElement<DeviceRestClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeviceRestClient create(Ref ref) {
    return deviceRestClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceRestClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceRestClient>(value),
    );
  }
}

String _$deviceRestClientHash() => r'2d1e57b0bc529d702a1a8f8a67a691fc603449fc';
