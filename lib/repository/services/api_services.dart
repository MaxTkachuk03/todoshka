import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:todoshka/models/models.dart';
import 'package:todoshka/repository/repository.dart';

class ApiServices extends AbstractApiServices {
  ApiServices({
    required this.dio,
    required this.tasksBox,
  });

  final Dio dio;
  final Box<Tasks> tasksBox;

  @override
  Future<List<Tasks>> getTasks() async {
    dio.interceptors.add(
      PrettyDioLogger(
        request: false,
        responseBody: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    final List<Tasks> tasks = await _getTasksFromApi();
    final tasksMap = {for (var e in tasks) e.name: e};
    await tasksBox.putAll(tasksMap);
    return tasks;
  }

  Future<List<Tasks>> _getTasksFromApi() async {
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

  @override
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
      debugPrint('posted');
      return Tasks.fromJson(jsonDecode(response.data));
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
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

    debugPrint('updated image');
  }

  @override
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
    debugPrint('updated status');
  }

  @override
  Future<void> deleteTask({
    String? taskId,
  }) async {
    try {
      await dio.delete('/tasks//$taskId');

      debugPrint('User deleted!');
    } catch (e) {
      debugPrint('Error deleting user: $e');
    }
  }

  Future<void> _updateDataOnApi(List<Tasks> tasks) async {
    final List<Map<String, dynamic>> tasksSync =
        tasks.map((item) => item.toJson()).toList();

    try {
      final response = await dio.post(
        "/tasks",
        data: tasksSync,
      );
      debugPrint(response.data);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> synchronizeData({required AbstarctLocalServices locaL}) async {
    final List<Tasks> localData = locaL.getLocalList();
    await _updateDataOnApi(localData);
  }
}
