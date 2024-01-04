import 'package:dio/dio.dart';
import 'package:personal_website/core/core.dart';

initDioPlugin() {
  Dio dio = Dio();
  sl.registerLazySingleton<Dio>(() => dio);
  sl<Dio>().interceptors.add(
        InterceptorsWrapper(
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) =>
                  handler.next(options),
          onResponse: (Response response, ResponseInterceptorHandler handler) =>
              handler.next(response),
          onError: (DioException error, ErrorInterceptorHandler handler) =>
              handler.next(error),
        ),
      );
}
