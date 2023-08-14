import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:todoshka/models/models.dart';

class ApiServices {
  static const baseURL = 'https://to-do.softwars.com.ua/';
  final dio = Dio(BaseOptions(baseUrl: baseURL));
  final dioPretty = PrettyDioLogger();

  Future<List<Tasks>> getTasks() async {
    dio.interceptors.add(
      PrettyDioLogger(
        request: false,
        responseBody: true,
        compact: true,
        maxWidth: 50,
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
    String? taskId,
    int? status,
    String? name,
    int? type,
    String? description,
    String? file,
    DateTime? finishDate,
    int? urgent,
    DateTime? syncTime,
  }) async {
    final response = await dio.post(
      '/tasks',
      data: [
        {
          'taskId': taskId,
          'status': status,
          'name': name,
          'type': type,
          'description': description,
          'file': file,
          'finishDate': finishDate?.toIso8601String().toString(),
          'urgent': urgent,
          'syncTime': DateTime.now().toIso8601String(),
        }
      ],
    );
    if (response.statusCode == 201) {
      return Tasks.fromJson(jsonDecode(response.data));
    } else {
      throw Exception('Failed to load ');
    }
  }
}
