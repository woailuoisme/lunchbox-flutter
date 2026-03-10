// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info_rest_client.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _PersonalInfoRestClient implements PersonalInfoRestClient {
  _PersonalInfoRestClient(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<ApiResponse<ProfileUpdateData>> updateProfile({
    String? nickname,
    String? gender,
    String? telephone,
    File? avatar,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (nickname != null) {
      _data.fields.add(MapEntry('nickname', nickname));
    }
    if (gender != null) {
      _data.fields.add(MapEntry('gender', gender));
    }
    if (telephone != null) {
      _data.fields.add(MapEntry('telephone', telephone));
    }
    if (avatar != null) {
      _data.files.add(
        MapEntry(
          'avatar',
          MultipartFile.fromFileSync(
            avatar.path,
            filename: avatar.path.split(Platform.pathSeparator).last,
          ),
        ),
      );
    }
    final _options = _setStreamType<ApiResponse<ProfileUpdateData>>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            '/api/v1/auth/profile_update',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponse<ProfileUpdateData> _value;
    try {
      _value = ApiResponse<ProfileUpdateData>.fromJson(
        _result.data!,
        (json) => ProfileUpdateData.fromJson(json as Map<String, dynamic>),
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

@ProviderFor(personalInfoRestClient)
final personalInfoRestClientProvider = PersonalInfoRestClientProvider._();

final class PersonalInfoRestClientProvider
    extends
        $FunctionalProvider<
          PersonalInfoRestClient,
          PersonalInfoRestClient,
          PersonalInfoRestClient
        >
    with $Provider<PersonalInfoRestClient> {
  PersonalInfoRestClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'personalInfoRestClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$personalInfoRestClientHash();

  @$internal
  @override
  $ProviderElement<PersonalInfoRestClient> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PersonalInfoRestClient create(Ref ref) {
    return personalInfoRestClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PersonalInfoRestClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PersonalInfoRestClient>(value),
    );
  }
}

String _$personalInfoRestClientHash() =>
    r'2f75d3a80aa51e8500e5f5e089134eda79a833ee';
