import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoshka/models/models.dart';
import 'package:todoshka/repository/repository.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<ChangeStatusEvent>((event, emit) async {
      try {
        await tasksRepository.updateTaskStatus(
            taskId: event.taskId, status: event.status);
        emit(TasksState(taskId: event.taskId, status: event.status));
      } catch (e) {
        Exception(e);
      }
    });

    on<CreateTasksEvent>((event, emit) async {
      try {
        final tasks = Tasks(
          taskId: event.taskId,
          name: event.name,
          status: event.status,
          type: event.type,
          description: event.description,
          file: event.file,
          finishDate: event.finishDate,
          urgent: event.urgent,
        );

        await tasksRepository.createTask(tasks: tasks);

        emit(state.copyWith(
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
        Exception(e);
      }
    });

    on<DeleteTasksEvent>((event, emit) async {
      try {
        if (state.finishDate == state.syncTime) {
          await tasksRepository.deleteTask(
            taskId: event.taskId,
          );
        }
        await tasksRepository.deleteTask(
          taskId: event.taskId,
        );
        emit(TasksState(taskId: event.taskId));
      } catch (e) {
        Exception(e);
      }
    });

    on<AddImageEvent>((event, emit) async {
      try {
        final file = await ImageServices().getImage();
        if (file.isNotEmpty) {
          emit(state.copyWith(file: file));
        }
      } catch (e) {
        Exception(e);
      }
    });

    on<DeleteExistImageEvent>((event, emit) async {
      try {
        await tasksRepository.updateTaskImage(
          file: "",
          taskId: event.taskId,
        );
        emit(state.copyWith(file: "", taskId: event.taskId));
      } catch (e) {
        Exception(e);
      }
    });

    on<DeleteNewImageEvent>((event, emit) async {
      try {
        emit(state.copyWith(file: ""));
      } catch (e) {
        Exception(e);
      }
    });
  }

  final tasksRepository = ApiServices();
}
