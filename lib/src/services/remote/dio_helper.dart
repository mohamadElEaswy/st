import 'package:dio/dio.dart';
import 'package:st/src/core/end_points/end_points.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        responseType: ResponseType.json
      ),
    );
  }

  static Future<Response> get({required String url}) async{

    dio!.options.headers ={
      'Content-Type': 'application/json',
    };
    return await dio!.get(url);
  }
}
