import 'package:dio/dio.dart';

class ApiServices {
  final dio = Dio();

  ApiServices();

  Future<void> getApi() async {
    Response response = await dio.get('https://to-do.softwars.com.ua');
    print(response);
  }
}
