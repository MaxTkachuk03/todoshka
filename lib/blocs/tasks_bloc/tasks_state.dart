part of 'tasks_bloc.dart';

@immutable
class TasksState extends Equatable {
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

  @override
  List<Object?> get props {
    return [
      taskId,
      status,
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