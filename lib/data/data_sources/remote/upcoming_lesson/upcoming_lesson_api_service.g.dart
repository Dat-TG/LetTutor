// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_lesson_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _UpcomingLessonApiService implements UpcomingLessonApiService {
  _UpcomingLessonApiService(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<UpcomingLessonModel?>> getUpcomingLesson() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Content-Type': 'application/json'};
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>?>(
        _setStreamType<HttpResponse<UpcomingLessonModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
      contentType: 'application/json',
    )
            .compose(
              _dio.options,
              '/booking/next',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    List<UpcomingLessonModel> result = _result.data!['data']
        .map<UpcomingLessonModel>((dynamic i) =>
            UpcomingLessonModel.fromJson(i as Map<String, dynamic>))
        .toList();
    result.sort(
      (a, b) => a.scheduleDetailInfo!.startPeriodTimestamp!
          .compareTo(b.scheduleDetailInfo!.startPeriodTimestamp!),
    );
    UpcomingLessonModel? value = result.isNotEmpty
        ? result[0].scheduleDetailInfo!.endPeriodTimestamp! >
                DateTime.now().millisecondsSinceEpoch
            ? result[0]
            : null
        : null;

    if (value == null) {
      for (int i = 1; i < result.length; i++) {
        if (result[i].scheduleDetailInfo!.endPeriodTimestamp! >
            DateTime.now().millisecondsSinceEpoch) {
          value = result[i];
          break;
        }
      }
    }

    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
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

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
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
