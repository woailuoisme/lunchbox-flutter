// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_rest_client.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _CommunityRestClient implements CommunityRestClient {
  _CommunityRestClient(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<ApiResponse<CommunityModel>> getCommunities({
    required double latitude,
    required double longitude,
    double? radius,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'latitude': latitude,
      r'longitude': longitude,
      r'radius': radius,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponse<CommunityModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/common/community',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<CommunityModel> _value;
    try {
      _value = ApiResponse<CommunityModel>.fromJson(
        _result.data!,
        (json) => CommunityModel.fromJson(json as Map<String, dynamic>),
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

@ProviderFor(communityRestClient)
final communityRestClientProvider = CommunityRestClientProvider._();

final class CommunityRestClientProvider
    extends
        $FunctionalProvider<
          CommunityRestClient,
          CommunityRestClient,
          CommunityRestClient
        >
    with $Provider<CommunityRestClient> {
  CommunityRestClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'communityRestClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$communityRestClientHash();

  @$internal
  @override
  $ProviderElement<CommunityRestClient> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CommunityRestClient create(Ref ref) {
    return communityRestClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommunityRestClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommunityRestClient>(value),
    );
  }
}

String _$communityRestClientHash() =>
    r'a8e2d91e4939d8ad3d5d6a961108b2a06a9fb3f7';
