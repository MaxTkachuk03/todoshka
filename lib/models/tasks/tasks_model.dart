import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tasks_model.g.dart';

//! Спробував розширення
@HiveType(typeId: 1)
@JsonSerializable()
class Tasks extends Equatable {
  Tasks({
    required this.taskId,
    required this.status,
    required this.name,
    required this.type,
    this.description,
    this.file,
    required this.finishDate,
    required this.urgent,
    this.syncTime,
  });

  @HiveField(0)
  final String taskId;
  @HiveField(1)
  final int? status;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final int type;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  String? file;
  @HiveField(6)
  final DateTime? finishDate;
  @HiveField(7)
  final int urgent;
  @HiveField(8)
  final DateTime? syncTime;

  factory Tasks.fromJson(Map<String, dynamic> json) => _$TasksFromJson(json);
  Map<String, dynamic> toJson() => _$TasksToJson(this);

  @override
  List<Object?> get props {
    return [
      taskId,
      name,
      type,
      description,
      file,
      finishDate,
      urgent,
      syncTime,
    ];
  }
}

//! Прописано вручну
// class Tasks {
//   const Tasks({
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

//    const  Tasks.initial({
//     this.taskId = '',
//     this.status = 0,
//     this.name = '',
//     this.type = 0,
//     this.description ='',
//     this.urgent=0,
//     this.file ='',
//     this.finishDate,
//     this.syncTime,
//   });

//   final String taskId;
//   final int status;
//   final String name;
//   final int type;
//   final String? description;
//   final String? file;
//   final DateTime? finishDate;
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

//   Tasks copyWith({
//     String? taskId,
//     int? status,
//     String? name,
//     int? type,
//     String? description,
//     String? file,
//     DateTime? finishDate,
//     int? urgent,
//     DateTime? syncTime,
//   }) {
//     return Tasks(
//       taskId: taskId ?? this.taskId,
//       status: status ?? this.status,
//       name: name ?? this.name,
//       type: type ?? this.type,
//       description: description ?? this.description,
//       file: file ?? this.file,
//       finishDate: finishDate ?? this.finishDate,
//       urgent: urgent ?? this.urgent,
//       syncTime: syncTime ?? this.syncTime,
//     );
//   }
// }
