// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasks_bloc.dart';

enum CreatingAndUpdatingStatus {
  initial,
  creating,
  created,
  updating,
  updated,
  error
}

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

class TasksCreateAndUpdateState extends TasksState {
  TasksCreateAndUpdateState({
    this.statuss = CreatingAndUpdatingStatus.initial,
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

  final CreatingAndUpdatingStatus statuss;
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
  List<Object?> get props => [
        statuss,
      ];

  TasksCreateAndUpdateState copyWith({
    CreatingAndUpdatingStatus? statuss,
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
    return TasksCreateAndUpdateState(
      statuss: statuss ?? this.statuss,
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

class TasksDeleteState extends TasksState {
  TasksDeleteState({
    this.taskId = '',
  });
  final String taskId;

  @override
  List<Object?> get props => [taskId];

  TasksDeleteState copyWith({
    String? taskId,
  }) {
    return TasksDeleteState(
      taskId: taskId ?? this.taskId,
    );
  }
}
