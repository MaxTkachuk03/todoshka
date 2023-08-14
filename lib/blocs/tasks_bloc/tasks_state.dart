// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasks_bloc.dart';

enum CreatinStatus { initial, creating, created, error }

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

class TasksCreatedState extends TasksState {
  TasksCreatedState({
    this.status = CreatinStatus.initial,
  });

  final CreatinStatus status;

  @override
  List<Object?> get props => [status];

  TasksCreatedState copyWith({
    CreatinStatus? status,
  }) {
    return TasksCreatedState(
      status: status ?? this.status,
    );
  }
}
