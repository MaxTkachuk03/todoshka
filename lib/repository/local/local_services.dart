import 'package:hive_flutter/hive_flutter.dart';

import 'package:todoshka/models/tasks/tasks_model.dart';
import 'package:todoshka/repository/repository.dart';

class LocalServices extends AbstarctLocalServices {
  LocalServices({
    required this.tasksBox,
  });

  final Box<Tasks> tasksBox;

  @override
  void createLocalTask({required Tasks tasks}) {
    tasksBox.put(tasks.taskId, tasks);
  }

  @override
  void deleteLocalTask({String? taskId}) async {
    tasksBox.delete(taskId);
  }

  @override
  List<Tasks> getLocalList() {
    final List<Tasks> tasks = tasksBox.values.toList();
    return tasks;
  }

  @override
  void updateLocalTaskImageOrStatus(
      {required String taskId, required Tasks tasks}) {
    tasksBox.put(taskId, tasks);
  }
}
