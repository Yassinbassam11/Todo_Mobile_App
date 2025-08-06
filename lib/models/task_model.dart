enum TaskStatus { pending, completed }

class TaskModel {
  String title;
  String description;
  TaskStatus status;

  TaskModel({
    required this.title,
    required this.description,
    this.status = TaskStatus.pending,
  });
}
