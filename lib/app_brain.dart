import 'package:todo_starter/models/task_model.dart';

class AppBrain {
  List<TaskModel> tasks = [
    TaskModel(
      title: "Task 1",
      description: "Description for Task 1",
      status: TaskStatus.pending,
    ),
    TaskModel(
      title: "Task 2",
      description: "Description for Task 2",
      status: TaskStatus.completed,
    ),
    TaskModel(
      title: "Task 3",
      description: "Description for Task 3",
      status: TaskStatus.pending,
    ),
  ];

  void addTask(TaskModel task) {
    tasks.add(task);
  }

  void removeTask(String id) {
    tasks.removeWhere((task) => task.id == id);
  }
}
