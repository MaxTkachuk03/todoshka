import 'package:todoshka/models/models.dart';

abstract class AbstarctLocalServices {
  List<Tasks> getLocalList();
  Future<void> createLocalTask({required Tasks tasks});
  Future<void> updateLocalTaskImageOrStatus(
      {required String taskId, required Tasks tasks});
  Future<void> deleteLocalTask({required String taskId});
}
