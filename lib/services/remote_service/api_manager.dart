import 'package:dio/dio.dart';
import 'dio_config.dart';

enum HttpMethod { get, post, put, delete }

class ApiManager {
  ApiManager._();

  static final ApiManager instance = ApiManager._();

  final _helper = DioConfig();

  Future<Response> request(String endPoint, HttpMethod method,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParams,
      bool isFormData = false,
      Options? options}) async {
    return requestWithUrl(
        endPoint, method, body, isFormData, queryParams, options);
  }

  Future<Response> requestWithUrl(
      String url,
      HttpMethod method,
      Map<String, dynamic>? body,
      bool? isFormData,
      Map<String, dynamic>? queryParams,
      Options? options) async {
    body ??= <String, dynamic>{};
    Response? response;
    switch (method) {
      case HttpMethod.get:
        response = await _helper.get(url, body: body, queryParams: queryParams);
        break;
      case HttpMethod.post:
        response = await _helper.post(
          url,
          body: body,
          isFormData: isFormData,
          queryParams: queryParams,
          options: options,
        );
        break;
      case HttpMethod.put:
        response = await _helper.put(url, body: body, queryParams: queryParams);
        break;
      case HttpMethod.delete:
        response =
            await _helper.delete(url, body: body, queryParams: queryParams);
        break;
      default:
        break;
    }
    return response!;
  }
}
