import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {},
    ));
    dio = Dio(BaseOptions(
        baseUrl: 'https://www.hotelsgo.co',
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          'Content-Type': 'application/json',
          // 'lang': 'en',
        },
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    // dio.options.headers['Authorization'] = 'Bearer YOUR_TOKEN_KEY';
    return await dio.get(url, queryParameters: query);
  }
}
