import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todoshka/repository/models/tasks_model.dart';

class ApiServices {
  final dio = Dio();

  //# Потрібний нам варіант
  Future<List<Tasks>> getTasks() async {
    Response response = await dio.get('https://to-do.softwars.com.ua//tasks');
    debugPrint(response.toString());
    // Створимо змінну словника,
    //І тут ми отримуємо response з нього отримуємо data, приводимо прямим кастом(as) до Map<String, dynamic>
    final data = response.data as Map<String, dynamic>;
    // Створмо змінну, яка буде приводити нашу мапу до списку
    //? entries - повертає список частин нашого словника, всі значення переведені в список
    //? map - метод, який проходиться по списку і робить щось з данними
    // В цього словника data, ми викликаємо список entries
    // Потім методом map() пробігаємось/проходимось по кожному елементу цього списку
    // І приводимо це до моделі Tasks
    final tasksList = data.entries.map(
      (e) => Tasks(
        taskId: (e.value as Map<String, dynamic>)["taskId"],
        status: (e.value as Map<String, dynamic>)["status"],
        name: (e.value as Map<String, dynamic>)["name"],
        type: (e.value as Map<String, dynamic>)["type"],
        urgent: (e.value as Map<String, dynamic>)["urgent"],
        finishDate: (e.value as Map<String, dynamic>)["finishDate"],
      ),
    );
    return tasksList.toList();
    //! Таким чином ми повертаємо dynamic, а не Tasks
    // return response.data;
  }

  //ApiServices();
  //# Перший варіант витягування апі
  // Future<void> getTasks() async {
  //   Response response = await dio.get('https://to-do.softwars.com.ua//tasks');
  //   debugPrint(response.toString());
  // }

  //# Другий варіант витягування апі
  // Future<Response> getTasks() async {
  //   String url = 'https://to-do.softwars.com.ua//tasks';
  //   Response response = await dio.get(url);
  //   debugPrint(response.toString());
  //   return response;
  // }

  //# Третій варіант витягування апі
  //! Але такий варіант нам не підходить, бо ми маємо розуміти яку модель нам повертає сервер,
  //! тобто струткурувати інформацію, яку ми отримуємо з цього методу,
  //! щоб інші розробники, які будуть працювавти з нашим кодом розуміли, який тип і як з ним працювати
  // Future<Map<Response, dynamic>> getTasks() async {
  //   String url = 'https://to-do.softwars.com.ua//tasks';
  //   Response response = await dio.get(url);
  //   debugPrint(response.toString());
  //   return response.data;
  // }
}
