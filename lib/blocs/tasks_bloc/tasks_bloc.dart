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
    on<CreateTasksEvent>((event, emit) async {
      try {
        // await tasksRepository.createTask(
        // );
        // final tasks = TasksCreateAndUpdateState()
        // emit(TasksCreateAndUpdateState().copyWith(
        //   taskId: event.taskId,
        //   name: event.name,
        //   status: event.status,
        //   type: event.type,
        //   description: event.description,
        //   file: event.file,
        //   finishDate: event.finishDate,
        //   urgent: event.urgent,
        // ));
      } on Exception catch (e) {
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
        // TasksCreateAndUpdateState().copyWith(
        //   name: event.name,
        //   status: event.status,
        //   type: event.type,
        //   description: event.description,
        //   file: event.file,
        //   finishDate: event.finishDate,
        //   urgent: event.urgent,
        // );
        // await tasksRepository.updateTask(
        //   name: event.name,
        //   status: event.status,
        //   type: event.type,
        //   description: event.description,
        //   file: event.file,
        //   finishDate: event.finishDate,
        //   urgent: event.urgent,
        // );
      } on Exception catch (e) {
        emit(TasksErrorLoadState(exception: e));
      }
    });
  }

  final tasksRepository = ApiServices();
}
