import 'package:dio/dio.dart';
import '../providers/UserAuth.dart';

class MyDio {
  late Dio _dio;

  MyDio({
    BaseOptions? options,
  }) {
    _dio = Dio(options ?? BaseOptions());
  }

  Future get(String url, {Map<String, dynamic>? params}) async {
    print(url);

    final token = await UserAuth().getAuthTokenToStorage();
    try {
      final response = await _dio.get(url,
          queryParameters: params,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to GET: ${e.message}');
    }
  }

  Future post(String url, {dynamic data}) async {
    final token = await UserAuth().getAuthTokenToStorage();
    print(url);

    try {
      final response = await _dio.post(
        url,
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      print('response is :$response');

      return response;
    } on DioException catch (e) {
      // ToastManager.errorToast('${e.response!.data["result"]["error"]}');
      // ToastManager.errorToast('${e.response!.data["error"]}');
      // print(e.response!.data["result"]["error"]);
      print('Error in POST request: ${e.response}');
      return e.response;
    }
  }

  Future<Response> put(String url, {dynamic data}) async {
    final token = await UserAuth().getAuthTokenToStorage();
    try {
      final response = await _dio.put(
        url,
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to PUT: ${e.message}');
    }
  }

  Future<Response> delete(String url,
      {Map<String, dynamic>? params, dynamic data}) async {
    final token = await UserAuth().getAuthTokenToStorage();

    try {
      final response = await _dio.delete(url,
          queryParameters: params,
          data: data,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to DELETE: ${e.message}');
    }
  }
}
