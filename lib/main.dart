import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todoshka/repository/repository.dart';
import 'package:todoshka/todo_app.dart';

void main() {
  final connectivity = Connectivity();

  GetIt.instance.registerLazySingleton(
    () => InternetConnection(
      connectivity: connectivity,
    ),
  );

  const baseURL = 'https://to-do.softwars.com.ua/';
  final dio = Dio(BaseOptions(baseUrl: baseURL));

  GetIt.I.registerLazySingleton(
    () => ApiServices(
      dio: dio,
    ),
  );

  GetIt.instance.registerLazySingleton(() => DateServices());

  final picker = ImagePicker();

  GetIt.instance.registerLazySingleton(
    () => ImageServices(
      picker: picker,
    ),
  );

  runApp(const ToDoApp());
}
