import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoshka/models/models.dart';
import 'package:todoshka/repository/repository.dart';

part 'task_list_bloc_event.dart';
part 'task_list_bloc_state.dart';

class TaskListBloc extends Bloc<TaskListBlocEvent, TaskListBlocState> {
  final tasksRepository = ApiServices();
  TaskListBloc() : super(TaskListBlocInitial()) {
    on<GetTasksListEvent>((event, emit) async {
      try {
        final getTasks = await tasksRepository.getTasks();
        emit(TasksListLoadedState(tasksList: getTasks));
      } catch (e) {
        emit(TasksListErrorLoadState(exception: e));
      } finally {
        event.completer?.complete();
      }
    });

    on<ChangeStatusEvent>((event, emit) async {
      try {
        if (state is TasksListLoadedState) {
          await tasksRepository.updateTaskStatus(
              taskId: event.taskId, status: event.status);
          final getTasks = await tasksRepository.getTasks();
          emit(TasksListLoadedState(tasksList: getTasks));
        }
      } catch (e) {
        emit(TasksListErrorLoadState(exception: e));
      }
    });
  }
}
