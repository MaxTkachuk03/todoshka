import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoshka/models/models.dart';
import 'package:todoshka/repository/repository.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksInitialState()) {
    on<GetTasksEvent>(
      (event, emit) async {
        try {
          if (state is! TasksLoadedState) {
            emit(TasksLoadingState());
          }
          final getTasks = await tasksRepository.getTasks();
          emit(TasksLoadedState().copyWith(tasksList: getTasks));
        } catch (e) {
          emit(TasksErrorLoadState(exception: e));
        } finally {
          event.completer?.complete();
        }
      },
    );

    on<CreateTasksEvent>((event, emit) async {
      try {
        emit(TasksCreateAndUpdateState()
            .copyWith(statuss: CreatingAndUpdatingStatus.creating));
        await tasksRepository.createTask(
          taskId: event.taskId,
          name: event.name,
          status: event.status,
          type: event.type,
          description: event.description,
          file: event.file,
          finishDate: event.finishDate,
          urgent: event.urgent,
        );
        emit(TasksCreateAndUpdateState()
            .copyWith(statuss: CreatingAndUpdatingStatus.created));
        emit(TasksCreateAndUpdateState().copyWith(
          taskId: event.taskId,
          name: event.name,
          status: event.status,
          type: event.type,
          description: event.description,
          file: event.file,
          finishDate: event.finishDate,
          urgent: event.urgent,
        ));
      } on Exception catch (e) {
        emit(TasksCreateAndUpdateState()
            .copyWith(statuss: CreatingAndUpdatingStatus.error));
        emit(TasksErrorLoadState(exception: e));
      }
    });

    on<DeleteTasksEvent>((event, emit) async {
      try {
        await tasksRepository.deleteTask(
          taskId: event.taskId,
        );
        emit(TasksDeleteState().copyWith(taskId: event.taskId));
      } catch (e) {
        emit(TasksErrorLoadState(exception: e));
      }
    });

    on<UpdateTasksEvent>((event, emit) async {
      try {
        emit(TasksCreateAndUpdateState()
            .copyWith(statuss: CreatingAndUpdatingStatus.updating));
        TasksCreateAndUpdateState().copyWith(
          name: event.name,
          status: event.status,
          type: event.type,
          description: event.description,
          file: event.file,
          finishDate: event.finishDate,
          urgent: event.urgent,
        );
        await tasksRepository.updateTask(
          name: event.name,
          status: event.status,
          type: event.type,
          description: event.description,
          file: event.file,
          finishDate: event.finishDate,
          urgent: event.urgent,
        );
        emit(TasksCreateAndUpdateState()
            .copyWith(statuss: CreatingAndUpdatingStatus.updated));
      } on Exception catch (e) {
        emit(TasksCreateAndUpdateState()
            .copyWith(statuss: CreatingAndUpdatingStatus.error));
        emit(TasksErrorLoadState(exception: e));
      }
    });
  }

  final tasksRepository = ApiServices();
}
