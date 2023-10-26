part of 'tasks_bloc.dart';

@immutable
abstract class TasksState extends Equatable {}

class TasksInitialState extends TasksState {
  @override
  List<Object?> get props => [];
}

class TasksCreateAndUpdateState extends TasksState {
  TasksCreateAndUpdateState({
    required this.tasks,
  });
  final Tasks tasks;

  @override
  List<Object?> get props => [tasks];
}

// class TasksCreateAndUpdateState extends TasksState {
//   TasksCreateAndUpdateState({
//     this.status = 0,
//     this.taskId = '',
//     this.name = '',
//     this.type = 0,
//     this.description,
//     this.file,
//     this.finishDate,
//     this.urgent = 0,
//     this.syncTime,
//   });

//   final String taskId;
//   final int status;
//   final String name;
//   final int type;
//   final String? description;
//   final String? file;
//   final DateTime? finishDate;
//   final int urgent;
//   final DateTime? syncTime;

//   @override
//   List<Object?> get props => [
//       ];

//   TasksCreateAndUpdateState copyWith({
//     String? taskId,
//     int? status,
//     String? name,
//     int? type,
//     String? description,
//     String? file,
//     DateTime? finishDate,
//     int? urgent,
//     DateTime? syncTime,
//   }) {
//     return TasksCreateAndUpdateState(

//       taskId: taskId ?? this.taskId,
//       status: status ?? this.status,
//       name: name ?? this.name,
//       type: type ?? this.type,
//       description: description ?? this.description,
//       file: file ?? this.file,
//       finishDate: finishDate ?? this.finishDate,
//       urgent: urgent ?? this.urgent,
//       syncTime: syncTime ?? this.syncTime,
//     );
//   }
// }

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

class TasksErrorLoadState extends TasksState {
  final Object? exception;

  TasksErrorLoadState({this.exception});
  @override
  List<Object?> get props => [exception];
}