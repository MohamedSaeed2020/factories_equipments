import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  //declare the baseUrl for the API and initialise the dio
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://www.example.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  //post method from the API
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    return await dio.post(
      url,
      data: data,
    );
  }
}
