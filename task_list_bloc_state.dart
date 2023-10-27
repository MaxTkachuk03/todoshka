part of 'task_list_bloc_bloc.dart';

abstract class TaskListBlocState extends Equatable {
}

final class TaskListBlocInitial extends TaskListBlocState {
  @override
  List<Object?> get props => [];
}

class TasksListLoadedState extends TaskListBlocState {
  TasksListLoadedState({
    required this.tasksList,
  });

  final List<Tasks> tasksList;

  @override
  List<Object?> get props => [tasksList];
}

class TasksListErrorLoadState extends TaskListBlocState {
  final Object? exception;

  TasksListErrorLoadState({this.exception});
  @override
  List<Object?> get props => [exception];
}
