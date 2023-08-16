// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tasks _$TasksFromJson(Map<String, dynamic> json) => Tasks(
      taskId: json['taskId'] as String,
      status: json['status'] as int,
      name: json['name'] as String,
      type: json['type'] as int,
      description: json['description'] as String?,
      urgent: json['urgent'] as int,
      file: json['file'] as String?,
      finishDate: DateTime.parse(json['finishDate'] as String),
    )..syncTime = json['syncTime'] == null
        ? null
        : DateTime.parse(json['syncTime'] as String);

Map<String, dynamic> _$TasksToJson(Tasks instance) => <String, dynamic>{
      'taskId': instance.taskId,
      'status': instance.status,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'file': instance.file,
      'finishDate': instance.finishDate?.toIso8601String(),
      'urgent': instance.urgent,
      'syncTime': instance.syncTime?.toIso8601String(),
    };
