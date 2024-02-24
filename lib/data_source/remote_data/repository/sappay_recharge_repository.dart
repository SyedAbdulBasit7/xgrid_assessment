import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import '../../../services/remote_service/dio_exceptions.dart';

class EcommerceRepository {

  Future<dynamic> getApiData() async {
    try {
       final response = await Future.delayed(const Duration(seconds: 1), () async {
      return await rootBundle.loadString('assets/home_api.json');
    });
      return response;
    } on DioException catch (e) {
      throw DioExceptions.fromDioError(e);
    } catch (e) {
      rethrow;
    }
  }


}
