import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoshka/models/models.dart';
import 'package:todoshka/repository/repository.dart';

part 'task_list_bloc_event.dart';
part 'task_list_bloc_state.dart';

class TaskListBloc extends Bloc<TaskListBlocEvent, TaskListBlocState> {
  final AbstractApiServices tasksRepository;
  final InternetConnection checkInternet;
  final AbstarctLocalServices tasksLocal;
  TaskListBloc(this.tasksRepository, this.checkInternet, this.tasksLocal)
      : super(TaskListBlocInitial()) {
    on<GetTasksListEvent>((event, emit) async {
      try {
        final internet = await checkInternet.checkInternetConnection();

        if (internet == true) {
          await tasksRepository.synchronizeData(locaL: tasksLocal);
          Timer(const Duration(seconds: 3), () {});
          final getTasks = await tasksRepository.getTasks();
          emit(TasksListLoadedState(tasksList: getTasks));
        } else {
          final getLocalTasks = tasksLocal.getLocalList();
          emit(TasksListLoadedState(tasksList: getLocalTasks));
        }
      } catch (e) {
        emit(TasksListErrorLoadState(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }
}
