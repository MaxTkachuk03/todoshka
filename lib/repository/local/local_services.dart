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
    // cryptoCoinsList
    //     .sort((a, b) => b.details.priceInUSD.compareTo(a.details.priceInUSD));
    return tasks;
  }

  @override
  void updateLocalTaskStatus({required String taskId, required int status}) {}

  @override
  void updateLocalTaskImage({required String taskId,required String file}) {
    //tasksBox.getAt(0)?.file = file;
  }
}
