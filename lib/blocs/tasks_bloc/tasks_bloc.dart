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
        emit(TasksCreatedState().copyWith(status: CreatinStatus.creating));
        await tasksRepository.createTask(
          taskId: event.taskId,
          name: event.name,
          status: event.status,
          type: event.type,
          description: event.description,
          file: event.file,
          finishDate: event.finishDate,
          urgent: event.urgent,
          syncTime: event.syncTime,
        );
        emit(TasksCreatedState().copyWith(status: CreatinStatus.created));
      } on Exception catch (e) {
        emit(TasksCreatedState().copyWith(status: CreatinStatus.error));
        emit(TasksErrorLoadState(exception: e));
      }
    });
  }
  final tasksRepository = ApiServices();
}
