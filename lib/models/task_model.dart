import 'package:flutter/material.dart';

enum TaskStatus { pending, completed }

class TaskModel {
  final String id = UniqueKey().toString();
  String title;
  String description;
  TaskStatus status;

  TaskModel({
    required this.title,
    required this.description,
    this.status = TaskStatus.pending,
  });
}
