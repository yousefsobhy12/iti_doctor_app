import 'package:dio/dio.dart';
import 'package:iti_doctor_app/core/networking/api_constants.dart';

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
  }

  static Future<Response<dynamic>> postData(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    final response = await _dio.post(path, data: data);
    return response;
  }
}
