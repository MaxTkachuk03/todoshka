import 'package:todoshka/models/models.dart';

abstract class AbstarctLocalServices {
  List<Tasks> getLocalList();
  void createLocalTask({required Tasks tasks});
  void updateLocalTaskImageOrStatus({required String taskId,required Tasks tasks});
  void deleteLocalTask({String? taskId});
}
