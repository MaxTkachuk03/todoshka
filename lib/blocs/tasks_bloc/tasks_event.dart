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
  @override
  List<Object?> get props => [];
}
