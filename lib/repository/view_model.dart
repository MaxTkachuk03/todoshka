class Tasks {
  Tasks({
    this.taskId = '',
    this.status = 0,
    this.name = '',
    this.type = 0,
    this.description = '',
    this.urgent = 0,
  });
  String taskId;
  int status;
  String name;
  int type;
  String description;
  String? file;
  DateTime? finishDate;
  int urgent;
  DateTime? syncTime;



}
