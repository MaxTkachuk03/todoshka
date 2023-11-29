import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todoshka/models/models.dart';
import 'package:todoshka/repository/repository.dart';
import 'package:todoshka/todo_app.dart';

void main() async {
  final connectivity = Connectivity();

  GetIt.instance.registerLazySingleton(
    () => InternetConnection(
      connectivity: connectivity,
    ),
  );

  const baseURL = 'https://to-do.softwars.com.ua/';
  final dio = Dio(BaseOptions(baseUrl: baseURL));

  GetIt.I.registerLazySingleton<AbstractApiServices>(
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

  const String tasksBox = 'tasksBox';

  final localBase = Hive;

  localBase
    ..initFlutter()
    ..registerAdapter(TasksAdapter());

  final box = await localBase.openBox(tasksBox);

  runApp(const ToDoApp());
}
