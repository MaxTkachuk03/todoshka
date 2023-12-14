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
  WidgetsFlutterBinding.ensureInitialized();
  final connectivity = Connectivity();

  GetIt.instance.registerLazySingleton(
    () => InternetConnection(
      connectivity: connectivity,
    ),
  );

  const String tasksBox = 'tasksBox';

  await Hive.initFlutter();
  Hive.registerAdapter(TasksAdapter());

  final box = await Hive.openBox<Tasks>(tasksBox);

  const baseURL = 'https://to-do.softwars.com.ua/';

  final dio = Dio(BaseOptions(baseUrl: baseURL));

  GetIt.I.registerLazySingleton<AbstractApiServices>(
    () => ApiServices(
      dio: dio,
      tasksBox: box,
    ),
  );

  GetIt.instance.registerLazySingleton(() => DateServices());

  final picker = ImagePicker();

  GetIt.instance.registerLazySingleton(
    () => ImageServices(
      picker: picker,
    ),
  );

  GetIt.I.registerLazySingleton<AbstarctLocalServices>(
    () => LocalServices(
      tasksBox: box,
    ),
  );

    runApp(const ToDoApp());
}
