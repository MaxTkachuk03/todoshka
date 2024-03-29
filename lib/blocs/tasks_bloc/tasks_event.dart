part of 'tasks_bloc.dart';

@immutable
abstract class TasksEvent extends Equatable {}

class GetTasksEvent extends TasksEvent {
  GetTasksEvent({
    this.completer,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}

class DeleteTasksEvent extends TasksEvent {
  DeleteTasksEvent({
    this.taskId = '',
  });
  final String taskId;

  @override
  List<Object?> get props => [taskId];

  DeleteTasksEvent copyWith({
    String? taskId,
  }) {
    return DeleteTasksEvent(
      taskId: taskId ?? this.taskId,
    );
  }
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
