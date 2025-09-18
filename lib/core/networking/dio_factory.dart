import 'package:dio/dio.dart';
import 'package:iti_doctor_app/core/networking/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static late Dio _dio;

  static void init() {
    const Duration duration = Duration(minutes: 2);
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        sendTimeout: duration,
        receiveTimeout: duration,
        connectTimeout: duration,
      ),
    );
    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        request: true,
        responseBody: true,
        requestHeader: true,
        error: true,
        enabled: true,
      ),
    );
  }

  static Future<Response<dynamic>> postData(
    String path, {
    Map<String, dynamic>? data,
    String? token,
  }) async {
    final response = await _dio.post(
      path,
      data: data,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return response;
  }

  static Future<Response<dynamic>> getData(String path, {String? token}) async {
    final response = await _dio.get(
      path,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return response;
  }
}
