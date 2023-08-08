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
  }
  final tasksRepository = ApiServices();
}
