import 'package:hive_flutter/hive_flutter.dart';

import 'package:todoshka/models/tasks/tasks_model.dart';
import 'package:todoshka/repository/repository.dart';

class LocalServices extends AbstarctLocalServices {
  LocalServices({
    required this.tasksBox,
  });

  final Box<Tasks> tasksBox;

  @override
  Future<void> createLocalTask({required Tasks tasks}) async {
    await tasksBox.put(tasks.taskId, tasks);
  }

  @override
  Future<void> deleteLocalTask({required String taskId}) async {
    await tasksBox.deleteFromDisk();
  }

  @override
  List<Tasks> getLocalList() {
    final List<Tasks> tasks = tasksBox.values.toList();
    return tasks;
  }

  @override
  Future<void> updateLocalTaskImageOrStatus(
      {required String taskId, required Tasks tasks}) async {
    await tasksBox.put(taskId, tasks);
  }
}
