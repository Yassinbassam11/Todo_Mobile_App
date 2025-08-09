import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_starter/models/task_model.dart';

class AppBrain {
  String? get currentUserId => FirebaseAuth.instance.currentUser?.uid;
  List<TaskModel> tasks = [
    TaskModel(
      title: "Task 1",
      description: "Description for Task 1",
      status: TaskStatus.pending,
    ),
    TaskModel(
      title: "Task 2",
      description: "Description for Task 2",
      status: TaskStatus.pending,
    ),
    TaskModel(
      title: "Task 3",
      description: "Description for Task 3",
      status: TaskStatus.pending,
    ),
  ];

  // void addTask(TaskModel task) {
  //   tasks.add(task);
  // }

  void removeTask(String id) {
    tasks.removeWhere((task) => task.id == id);
  }

  void removeAllTasks() {
    tasks.clear();
  }

  Future<void> addTask(TaskModel task) async {
    // Simulate adding a task to Firestore
    if (currentUserId != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserId)
          .collection('tasks')
          .add({
            'title': task.title,
            'description': task.description,
            'status': task.status == TaskStatus.completed
                ? "Completed"
                : "Pending",
          });
    } else {
      throw Exception("User not authenticated");
    }
  }
}
