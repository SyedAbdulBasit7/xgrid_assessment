import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dios;
import 'package:dio/io.dart';

import '../../utils/app_urls/urls.dart';

class DioConfig {
  final dio = dios.Dio();
  final _baseUrl = AppURLs.baseURL;

  Future<dios.Dio> getApiClient() async {
    try {
      // String token = await getIt<SharedPreferencesService>().getString('key');
      String token = '';
      dio.interceptors.clear();
      dio.options.baseUrl = _baseUrl;
      dio.options.connectTimeout = const Duration(milliseconds: 16000);
      dio.options.receiveTimeout = const Duration(milliseconds: 16000);
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
          HttpClient()
            ..badCertificateCallback =
                (X509Certificate cert, String host, int port) => true;
      dio.interceptors.add(
        dios.QueuedInterceptorsWrapper(
          onRequest: (options, interceptorHandler) {
            // Do something before request is sent
            if (token.length > 5) {
              options.headers = {
                "Authorization": "Bearer $token",
                "Accept": "application/json",
                "Content-type": "application/json"
              };
            } else {
              options.headers = {
                "Accept": "application/json",
                "Content-type": "application/json"
              };
            }
            return interceptorHandler.next(options);
          },
          onResponse: (response, interceptorHandler) {
            // Do something with response data
            return interceptorHandler.next(response); // continue
          },
          onError: (error, interceptorHandler) async {
            return interceptorHandler.next(error);
          },
        ),
      );
    } catch (err) {
      rethrow;
    }

    return dio;
  }

  Future<dios.Response> get(url,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParams,
      dios.Options? options}) async {
    String params = "?";
    body?.forEach((key, value) {
      params += "$key=$value&";
    });
    if (params == "?") {
      params = "";
    }
    url = "$_baseUrl$url$params";
    // ignore: avoid_print
    var dio = await getApiClient();
    final response =
        await dio.get(url, options: options, queryParameters: queryParams);
    return response;
  }

  Future<dios.Response> post(url,
      {Map<String, dynamic>? body,
      isFormData,
      Map<String, dynamic>? queryParams,
      dios.Options? options}) async {
    dios.FormData formData = dios.FormData.fromMap(body!);
    var dio = await getApiClient();
    final response = await dio.post("$_baseUrl$url",
        data: isFormData ? formData : jsonEncode(body),
        options: options,
        queryParameters: queryParams);
    return response;
  }

  Future<dios.Response> put(url,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParams,
      dios.Options? options}) async {
    var dio = await getApiClient();
    final response = await dio.put("$_baseUrl$url",
        data: jsonEncode(body), options: options, queryParameters: queryParams);
    return response;
  }

  Future<dios.Response> delete(url,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParams,
      dios.Options? options}) async {
    var dio = await getApiClient();
    final response = await dio.delete("$_baseUrl$url",
        data: jsonEncode(body), options: options, queryParameters: queryParams);
    return response;
  }
}
