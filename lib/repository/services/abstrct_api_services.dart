import 'package:todoshka/models/models.dart';

abstract class AbstractApiServices {
  Future<List<Tasks>> getTasks();
  Future<Tasks> createTask({required Tasks tasks});
  Future<void> updateTaskImage({required String taskId, required String file});
  Future<void> updateTaskStatus({required String taskId, required int status});
  Future<void> deleteTask({String? taskId});
}
