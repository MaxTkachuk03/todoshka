// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasksAdapter extends TypeAdapter<Tasks> {
  @override
  final int typeId = 1;

  @override
  Tasks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tasks(
      taskId: fields[0] as String,
      status: fields[1] as int?,
      name: fields[2] as String,
      type: fields[3] as int,
      description: fields[4] as String?,
      file: fields[5] as String?,
      finishDate: fields[6] as DateTime?,
      urgent: fields[7] as int,
      syncTime: fields[8] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Tasks obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.taskId)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.file)
      ..writeByte(6)
      ..write(obj.finishDate)
      ..writeByte(7)
      ..write(obj.urgent)
      ..writeByte(8)
      ..write(obj.syncTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tasks _$TasksFromJson(Map<String, dynamic> json) => Tasks(
      taskId: json['taskId'] as String,
      status: json['status'] as int?,
      name: json['name'] as String,
      type: json['type'] as int,
      description: json['description'] as String?,
      file: json['file'] as String?,
      finishDate: json['finishDate'] == null
          ? null
          : DateTime.parse(json['finishDate'] as String),
      urgent: json['urgent'] as int,
      syncTime: json['syncTime'] == null
          ? null
          : DateTime.parse(json['syncTime'] as String),
    );

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
