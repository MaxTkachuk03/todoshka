import 'package:todoshka/models/models.dart';

abstract class AbstarctLocalServices {
  List<Tasks> getLocalList();
  Future<void> createLocalTask({required Tasks tasks});
  Future<void> updateLocalTaskImage(
      {required String taskId, required String file});
  Future<void> updateLocalTaskStatus(
      {required String taskId, required int status});
  Future<void> deleteLocalTask({required String taskId});
}
