part of 'tasks_bloc.dart';

@immutable
abstract class TasksState extends Equatable {}

class TasksInitialState extends TasksState {
  @override
  List<Object?> get props => [];
}

class TasksLoadingState extends TasksState {
  @override
  List<Object?> get props => [];
}

class TasksLoadedState extends TasksState {
  TasksLoadedState({
    this.tasksList = const [],
  });

  final List<Tasks> tasksList;

  TasksLoadedState copyWith({
    List<Tasks>? tasksList,
  }) {
    return TasksLoadedState(
      tasksList: tasksList ?? this.tasksList,
    );
  }

  @override
  List<Object?> get props => [tasksList];
}

class TasksErrorLoadState extends TasksState {
  final Object? exception;

  TasksErrorLoadState({this.exception});
  @override
  List<Object?> get props => [exception];
}
