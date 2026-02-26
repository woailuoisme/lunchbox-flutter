// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_rest_client.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _InviteRestClient implements InviteRestClient {
  _InviteRestClient(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<ApiResponse<InvitationCodeModel>> generateInvitationCode() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponse<InvitationCodeModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/user/invitation/generate',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<InvitationCodeModel> _value;
    try {
      _value = ApiResponse<InvitationCodeModel>.fromJson(
        _result.data!,
        (json) => InvitationCodeModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiResponse<List<InvitationRecordModel>>>
  getInvitationRecords() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponse<List<InvitationRecordModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/user/invitation/records',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<List<InvitationRecordModel>> _value;
    try {
      _value = ApiResponse<List<InvitationRecordModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<InvitationRecordModel>(
                    (i) => InvitationRecordModel.fromJson(
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
  Future<ApiResponse<InvitationVerifyModel>> verifyInvitationCode({
    required String code,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'code': code};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponse<InvitationVerifyModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/user/invitation/verify',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<InvitationVerifyModel> _value;
    try {
      _value = ApiResponse<InvitationVerifyModel>.fromJson(
        _result.data!,
        (json) => InvitationVerifyModel.fromJson(json as Map<String, dynamic>),
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

@ProviderFor(inviteRestClient)
final inviteRestClientProvider = InviteRestClientProvider._();

final class InviteRestClientProvider
    extends
        $FunctionalProvider<
          InviteRestClient,
          InviteRestClient,
          InviteRestClient
        >
    with $Provider<InviteRestClient> {
  InviteRestClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inviteRestClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inviteRestClientHash();

  @$internal
  @override
  $ProviderElement<InviteRestClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  InviteRestClient create(Ref ref) {
    return inviteRestClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InviteRestClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InviteRestClient>(value),
    );
  }
}

String _$inviteRestClientHash() => r'64637862c854d10819ddb61afe151735a189aa7a';
