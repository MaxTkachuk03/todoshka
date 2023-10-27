// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_list_bloc_bloc.dart';

abstract class TaskListBlocEvent extends Equatable {}

class GetTasksListEvent extends TaskListBlocEvent {
  GetTasksListEvent({
    this.completer,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}

class ChangeStatusEvent extends TaskListBlocEvent {
  ChangeStatusEvent({
    this.status = 0,
    this.taskId = '',
  });

  final int status;
  final String taskId;

  @override
  List<Object?> get props => [status];
}
