// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RemoteDataSource implements RemoteDataSource {
  _RemoteDataSource(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://run.mocky.io/v3/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<DishModel>> getAllDishes() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch(_setStreamType<List<DishModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/aba7ecaa-0a70-453b-b62d-0e326c859b3b',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));

    List<DishModel> value = [];
    for (var i in _result.data!['dishes']) {
      value.add(DishModel.fromJson(i as Map<String, dynamic>));
    }

    return value;
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
}
