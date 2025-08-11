import 'package:flutter/material.dart';

enum TaskStatus { pending, completed }

class TaskModel {
  String? id;
  String title;
  String description;
  TaskStatus status;

  TaskModel({
    required this.title,
    required this.description,
    this.status = TaskStatus.pending,
    // this.id=  UniqueKey().toString(),
    required this.id,
  });
}
