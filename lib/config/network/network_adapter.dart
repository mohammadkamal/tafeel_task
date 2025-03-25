import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

class NetworkAdapter {
  NetworkAdapter() {
    client = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'))
      ..interceptors.addAll([
        TalkerDioLogger(
            settings: TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
        ))
      ]);
  }

  late final Dio client;

  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    final response =
        await client.get<T>(path, queryParameters: queryParameters);

    if (response.statusCode != 200) {
      return Future.error(response.data.toString());
    }

    return response;
  }
}
