import 'package:dio/dio.dart';
import 'api_response.dart';

class DioConnect {

  final Dio _dio = Dio();

  DioConnect() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      //todo add accept json header
      // options.headers()
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      return handler.next(e); //continue
    }));
  }

  Future<ApiResponse<T>> call<T>({required Future<Response<dynamic>> Function(Dio dio) caller, required T Function(dynamic data) converter}) async {
    try {
      final response = await caller(_dio);
      print(response.data);
      print(response.data.runtimeType);
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return ApiResponse(
            statusCode: response.statusCode!, data: converter(response.data));
      } else {
        return ApiResponse(
            statusCode: response.statusCode ?? 900,
            errorMessage: response.statusMessage);
      }
    } catch (e) {
      print(e);
      return ApiResponse(statusCode: 899, errorMessage: e.toString());
    }
  }
}
