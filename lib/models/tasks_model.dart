class Tasks {
  Tasks({
    required this.taskId,
    required this.status,
    required this.name,
    required this.type,
    this.description,
    required this.urgent,
    this.file,
    required this.finishDate,
  });

  String taskId;
  int status;
  String name;
  int type;
  String? description;
  String? file;
  DateTime finishDate;
  int urgent;
  DateTime? syncTime;
}
