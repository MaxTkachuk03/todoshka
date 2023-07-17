import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:todoshka/models/tasks_model.dart';

class ApiServices {
  final dio = Dio();
  final dioPretty = PrettyDioLogger();

  Future<List<Tasks>> getTasks() async {
  
    dio.interceptors.add(
      PrettyDioLogger(
          requestHeader: true,
          requestBody: false,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90),
    );

    final response = await dio.get('https://to-do.softwars.com.ua//tasks');
    if (response.statusCode == 200) {
      return _fromJsonToList(
        response,
      ).toList();
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
     
    return data
        .map(
          (tasks) => Tasks.fromJson(tasks),
        )
        .toList();
  }

//  Future<void> get(List<Tasks> tasks) async {
//   final get = await dio.get('https://to-do.softwars.com.ua//tasks');

//   if(get.statusCode == 200){
//     final json = jsonDecode(get.data);
//     final result = json['data'];
//     tasks = result;
//   }
//  }

  //# Нульовий варінат витягуваннят апі
  // Future<List<Tasks>> getTasks() async {
  //   Response response = await dio.get('https://to-do.softwars.com.ua//tasks');
  //   debugPrint(response.data.toString());
  //   if (response.statusCode == 200) {
  //     // Створимо змінну словника,
  //     //І тут ми отримуємо response з нього отримуємо data, приводимо прямим кастом(as) до Map<String, dynamic>
  //     final Map<String, dynamic> dataTasks =
  //         response.data as Map<String, dynamic>;
  //     // Створмо змінну, яка буде приводити нашу мапу до списку
  //     //? entries - повертає список частин нашого словника, всі значення переведені в список
  //     //? map - метод, який проходиться по списку і робить щось з данними
  //     // В цього словника data, ми викликаємо список entries
  //     // Потім методом map() пробігаємось/проходимось по кожному елементу цього списку
  //     // І приводимо це до моделі Tasks
  //     final List<Tasks> tasksList = dataTasks.values
  //         .map<Tasks>(
  //           (e) => Tasks.fromJson(e),
  //         )
  //         .toList();
  //     return tasksList;
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  //   //! Таким чином ми повертаємо dynamic, а не Tasks
  //   // return response.data;
  // }

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
