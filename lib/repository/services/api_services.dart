import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:todoshka/models/models.dart';

class ApiServices {
  ApiServices({
    required this.dio,
  });

  final Dio dio;

  Future<List<Tasks>> getTasks() async {
    dio.interceptors.add(
      PrettyDioLogger(
        request: false,
        responseBody: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    final response = await dio.get('/tasks');
    if (response.statusCode == 200) {
      return _fromJsonToList(response).toList();
    } else {
      throw Exception('Failed to load ');
    }
  }

  List<Tasks> _fromJsonToList(Response response) {
    //!
    final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
      response.data['data'],
    );
    //!
    // final List<Map<String, dynamic>> data = List.from(response.data['data']);

    return data.map((tasks) => Tasks.fromJson(tasks)).toList();
  }

  Future<Tasks> createTask({
    required Tasks tasks,
  }) async {
    final response = await dio.post(
      '/tasks',
      data: [
        {
          "taskId": tasks.taskId,
          'status': tasks.status,
          'name': tasks.name,
          'type': tasks.type,
          'description': tasks.description,
          'file': tasks.file,
          'finishDate': tasks.finishDate?.toIso8601String(),
          'urgent': tasks.urgent,
          'syncTime': DateTime.now().toIso8601String(),
        },
      ],
    );
    if (response.statusCode == 201) {
      print('posted');
      return Tasks.fromJson(jsonDecode(response.data));
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<void> updateTaskImage({
    required String taskId,
    required String file,
  }) async {
    await dio.put(
      '/tasks//$taskId',
      data: {
        'file': file,
      },
    );
    print('updated image');
  }

  Future<void> updateTaskStatus({
    required String taskId,
    required int status,
  }) async {
    await dio.put(
      '/tasks//$taskId',
      data: {
        'status': status,
      },
    );
    print('updated status');
  }

  Future<void> deleteTask({
    String? taskId,
  }) async {
    try {
      await dio.delete('/tasks//$taskId');
      print('User deleted!');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
