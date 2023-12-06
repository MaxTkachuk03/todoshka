import 'package:todoshka/models/models.dart';

abstract class AbstarctLocalServices {
  List<Tasks> getLocalList();
  void createLocalTask({required Tasks tasks});
  void updateLocalTaskImage({required String taskId, required String file});
  void updateLocalTaskStatus({required String taskId, required int status});
  void deleteLocalTask({String? taskId});
}
