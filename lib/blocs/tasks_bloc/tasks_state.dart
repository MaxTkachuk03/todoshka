part of 'tasks_bloc.dart';

@immutable
class TasksState {
  const TasksState({
    this.status = 0,
    this.taskId = '',
    this.name = '',
    this.type = 0,
    this.description,
    this.file,
    this.finishDate,
    this.urgent = 0,
    this.syncTime,
  });

  final String taskId;
  final int status;
  final String name;
  final int type;
  final String? description;
  final String? file;
  final DateTime? finishDate;
  final int urgent;
  final DateTime? syncTime;

  // @override
  // List<Object?> get props {
  //   return [
  //     taskId,
  //     status,
  //     name,
  //     type,
  //     description,
  //     file,
  //     finishDate,
  //     urgent,
  //     syncTime,
  //   ];
  // }

  TasksState copyWith({
    String? taskId,
    int? status,
    String? name,
    int? type,
    String? description,
    String? file,
    DateTime? finishDate,
    int? urgent,
    DateTime? syncTime,
  }) {
    return TasksState(
      taskId: taskId ?? this.taskId,
      status: status ?? this.status,
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      file: file ?? this.file,
      finishDate: finishDate ?? this.finishDate,
      urgent: urgent ?? this.urgent,
      syncTime: syncTime ?? this.syncTime,
    );
  }
}
