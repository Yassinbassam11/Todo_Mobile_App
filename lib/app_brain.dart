import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_starter/models/task_model.dart';

class AppBrain {
  String? get currentUserId => FirebaseAuth.instance.currentUser?.uid;
  List<TaskModel> tasks = [
    TaskModel(
      id: UniqueKey().toString(),
      title: "Task 1",
      description: "Description for Task 1",
      status: TaskStatus.pending,
    ),
    TaskModel(
      id: UniqueKey().toString(),
      title: "Task 2",
      description: "Description for Task 2",
      status: TaskStatus.pending,
    ),
    TaskModel(
      id: UniqueKey().toString(),
      title: "Task 3",
      description: "Description for Task 3",
      status: TaskStatus.pending,
    ),
  ];

  Future<void> removeAllTasks() async {
    tasks.clear();

    if (currentUserId != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserId)
          .collection('tasks')
          .get()
          .then((snapshot) {
            for (var doc in snapshot.docs) {
              doc.reference.delete();
            }
          });
    }
  }

  Future<void> addTask(TaskModel task) async {
    try {
      tasks.add(task);

      if (currentUserId != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUserId)
            .collection('tasks')
            .doc(task.id)
            .set({
              'id': task.id,
              'title': task.title,
              'description': task.description,
              'status': task.status == TaskStatus.completed
                  ? "Completed"
                  : "Pending",
            });
      } else {
        throw Exception("User not authenticated");
      }
    } catch (e) {
      print("Error: $e");
      return;
    }
  }

  Future<void> removeTask(String taskId) async {
    try {
      tasks.removeWhere((task) => task.id == taskId);

      if (currentUserId != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUserId)
            .collection('tasks')
            .doc(taskId)
            .delete();
      } else {
        throw Exception("User not authenticated");
      }
    } catch (e) {
      print("Error: $e");
      return;
    }
  }

  Future<void> updateTaskState(TaskModel task) async {
    try {
      if (currentUserId != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUserId)
            .collection('tasks')
            .doc(task.id)
            .update({
              'status': task.status == TaskStatus.completed
                  ? "Completed"
                  : "Pending",
            });
      } else {
        throw Exception("User not authenticated");
      }
    } catch (e) {
      print("Error: $e");
      return;
    }
  }

  Future<void> getTasks() async {
    try {
      final collection = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('tasks')
          .get();
      final fetchedTasks = collection.docs.map((doc) {
        final data = doc.data();
        return TaskModel(
          id: data['id'],
          title: data['title'],
          description: data['description'],
          status: data['status'] == "Completed"
              ? TaskStatus.completed
              : TaskStatus.pending,
        );
      }).toList();
      tasks = fetchedTasks;
    } catch (e) {
      print("Error fetching tasks: $e");
      return;
    }
  }
}
