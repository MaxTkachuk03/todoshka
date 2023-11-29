import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoshka/models/models.dart';
import 'package:todoshka/repository/repository.dart';

part 'task_list_bloc_event.dart';
part 'task_list_bloc_state.dart';

class TaskListBloc extends Bloc<TaskListBlocEvent, TaskListBlocState> {
  final AbstractApiServices tasksRepository;
  TaskListBloc(this.tasksRepository) : super(TaskListBlocInitial()) {
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
  }
}
