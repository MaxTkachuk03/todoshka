import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoshka/models/models.dart';
import 'package:todoshka/repository/repository.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc(
      this.tasksRepository, this.image, this.checkInternet, this.tasksLocal)
      : super(const TasksState()) {
    on<ChangeStatusEvent>((event, emit) async {
      try {
        final internet = await checkInternet.checkInternetConnection();

        if (internet == true) {
          await tasksRepository.updateTaskStatus(
              taskId: event.taskId, status: event.status);
        }
        emit(TasksState(taskId: event.taskId, status: event.status));
      } catch (e) {
        Exception(e);
      }
    });

    on<CreateTasksEvent>((event, emit) async {
      try {
        final internet = await checkInternet.checkInternetConnection();

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

        if (internet == true) {
          await tasksRepository.createTask(tasks: tasks);
          tasksLocal.createLocalTask(tasks: tasks);
        } else {
          tasksLocal.createLocalTask(tasks: tasks);
        }

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
        final internet = await checkInternet.checkInternetConnection();

        if (state.finishDate == DateTime.now()) {
          await tasksRepository.deleteTask(
            taskId: event.taskId,
          );
        }

        if (internet == true) {
          await tasksRepository.deleteTask(taskId: event.taskId);
          tasksLocal.deleteLocalTask(taskId: event.taskId);
        } else {
          tasksLocal.deleteLocalTask(taskId: event.taskId);
        }
        emit(TasksState(taskId: event.taskId));
      } catch (e) {
        Exception(e);
      }
    });

    on<AddImageEvent>((event, emit) async {
      try {
        final file = await image.getImage();
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

    on<AddImageEvent>((event, emit) async {
      try {
        final file = await image.getImage();
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

  final AbstractApiServices tasksRepository;
  final ImageServices image;
  final InternetConnection checkInternet;
  final AbstarctLocalServices tasksLocal;
}
