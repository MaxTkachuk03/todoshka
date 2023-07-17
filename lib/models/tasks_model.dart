import 'package:json_annotation/json_annotation.dart';

part 'tasks_model.g.dart';

@JsonSerializable()
class Tasks {
  Tasks({
    required this.taskId,
    required this.status,
    required this.name,
    required this.type,
    this.description,
    required this.urgent,
    this.file,
    required this.finishDate,
  });
  
  String taskId;
  int status;
  String name;
  int type;
  String? description;
  String? file;
  DateTime finishDate;
  int urgent;
  DateTime? syncTime;

  factory Tasks.fromJson(Map<String, dynamic> json) => _$TasksFromJson(json);
  Map<String, dynamic> toJson() => _$TasksToJson(this);
}



//# Клас для нульового варінату витягування апі
// class Tasks {
//   Tasks({
//     required this.taskId,
//     required this.status,
//     required this.name,
//     required this.type,
//     this.description,
//     required this.urgent,
//     this.file,
//     required this.finishDate,
//   });

//   String taskId;
//   int status;
//   String name;
//   int type;
//   String? description;
//   String? file;
//   DateTime finishDate;
//   int urgent;
//   DateTime? syncTime;
// }


// class Tasks {
//   Tasks({
//     required this.taskId,
//     required this.status,
//     required this.name,
//     required this.type,
//     this.description,
//     required this.urgent,
//     this.file,
//     this.syncTime,
//     required this.finishDate, 
//   });

//   final String taskId;
//   final int status;
//   final String name;
//   final int type;
//   final String? description;
//   final String? file;
//   final DateTime finishDate;
//   final int urgent; 
//   final DateTime? syncTime;

//   factory Tasks.fromJson(Map<String, dynamic> json) {
//     return Tasks(

//       taskId: json['taskId'],
//       status: json['status'],
//       type: json['type'],
//       name: json['name'],
//       finishDate: json['finishDate'],
//       urgent: json['urgent'],
//     );
//   }

//   Map<String, dynamic> toJson(Tasks tasks) => {
//       'taskId': tasks.taskId,
//       'status': tasks.status,
//       'type': tasks.type,
//       'name': tasks.name,
//       'finishDate': tasks.finishDate,
//       'urgent': tasks.urgent,
//   };
// }


// class Album {
//   final int userId;
//   final int id;
//   final String title;

//   const Album({
//     required this.userId,
//     required this.id,
//     required this.title,
//   });

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }




// class Photo {
//   final int albumId;
//   final int id;
//   final String title;
//   final String url;
//   final String thumbnailUrl;

//   const Photo({
//     required this.albumId,
//     required this.id,
//     required this.title,
//     required this.url,
//     required this.thumbnailUrl,
//   });

//   factory Photo.fromJson(Map<String, dynamic> json) {
//     return Photo(
//       albumId: json['albumId'] as int,
//       id: json['id'] as int,
//       title: json['title'] as String,
//       url: json['url'] as String,
//       thumbnailUrl: json['thumbnailUrl'] as String,
//     );
//   }
// }