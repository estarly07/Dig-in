import 'package:dio/dio.dart';

class ProvideDio {
    final dio = Dio(BaseOptions(
    baseUrl: "https://dig-in-b82f5-default-rtdb.firebaseio.com/",
    contentType: "application/json;charset=UTF-8",
  ));

}