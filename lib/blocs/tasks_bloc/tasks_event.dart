part of 'tasks_bloc.dart';

@immutable
abstract class TasksEvent extends Equatable{}

class GetTasksEvent extends TasksEvent {
  GetTasksEvent({
    this.completer,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}

class UpdateTasksEvent extends TasksEvent {
  @override
  List<Object?> get props => [];
}

class DeleteTasksEvent extends TasksEvent {
  @override
  List<Object?> get props => [];
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
