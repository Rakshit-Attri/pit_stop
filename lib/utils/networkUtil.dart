import 'package:dio/dio.dart';

class MyDio {
  late Dio _dio;

  MyDio({
    BaseOptions? options,
  }) {
    _dio = Dio(options ?? BaseOptions());
  }

  Future get(String url, {Map<String, dynamic>? params}) async {
    // final token = await UserAuth().getAuthTokenToStorage();
    final token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NmQyMGQwNTI2ZjUxM2FlNGQzNjAwOGMiLCJpYXQiOjE3MjUxODk3NzUsImV4cCI6MTcyNjkxNzc3NX0.QBgcq85kW41_dNbU0gmVEuqJWh6ZSOUvkvR0sBpgjS0';

    try {
      final response = await _dio.get(url,
          queryParameters: params,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      // print(url);
      // print('response: $response');
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to GET: ${e.message}');
    }
  }

  Future post(String url, {dynamic data}) async {
    // final token = await UserAuth().getAuthTokenToStorage();
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NmQyMGQwNTI2ZjUxM2FlNGQzNjAwOGMiLCJpYXQiOjE3MjUxODk3NzUsImV4cCI6MTcyNjkxNzc3NX0.QBgcq85kW41_dNbU0gmVEuqJWh6ZSOUvkvR0sBpgjS0';
    try {
      // print('trying post');
      print('trying data is :$token');

      final response = await _dio.post(
        url,
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      print(url);

      return response;
    } on DioException catch (e) {
      // ToastManager.errorToast('${e.response!.data["result"]["error"]}');
      // ToastManager.errorToast('${e.response!.data["error"]}');
      // print(e.response!.data["result"]["error"]);
      print('Error in POST request: ${e.response}');

      return e.response;
      // throw Exception('Failed to POST: ${e.message}');
    }
  }

  Future<Response> put(String url, {dynamic data}) async {
    // final token = await UserAuth().getAuthTokenToStorage();
    final token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NmQyMGQwNTI2ZjUxM2FlNGQzNjAwOGMiLCJpYXQiOjE3MjUwOTg5MjcsImV4cCI6MTcyNjgyNjkyN30.Ux72iqQBJS081Asjc7yz8RvkK7e1XFX5SVY1K7IDknI';

    // print('put url:$url');
    // print('data :$data');

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
    // final token = await UserAuth().getAuthTokenToStorage();
    final token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NmQyMGQwNTI2ZjUxM2FlNGQzNjAwOGMiLCJpYXQiOjE3MjUwOTg5MjcsImV4cCI6MTcyNjgyNjkyN30.Ux72iqQBJS081Asjc7yz8RvkK7e1XFX5SVY1K7IDknI';

    try {
      final response = await _dio.delete(
        url,
        queryParameters: params,
        data: data,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to DELETE: ${e.message}');
    }
  }
}
