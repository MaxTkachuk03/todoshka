part of 'tasks_bloc.dart';

@immutable
abstract class TasksEvent extends Equatable {}

class ChangeStatusEvent extends TasksEvent {
  ChangeStatusEvent({
    this.status = 0,
    this.taskId = '',
  });

  final int status;
  final String taskId;

  @override
  List<Object?> get props => [status];
}

class DeleteTasksEvent extends TasksEvent {
  DeleteTasksEvent({
    this.taskId = '',
  });
  final String taskId;

  @override
  List<Object?> get props => [taskId];
}

class CreateTasksEvent extends TasksEvent {
  CreateTasksEvent({
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
  List<Object?> get props => [];
}

class UpdateTasksEvent extends TasksEvent {
  UpdateTasksEvent({
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
  List<Object?> get props => [];
}
