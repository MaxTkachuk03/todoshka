part of 'tasks_bloc.dart';

@immutable
abstract class TasksState {}

class TasksInitialState extends TasksState {}

class TasksLoadingState extends TasksState{}

class TasksLoadedState extends TasksState{}

class TasksErrorLoadState extends TasksState{}