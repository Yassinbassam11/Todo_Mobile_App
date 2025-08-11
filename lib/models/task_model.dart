// ignore: unused_import
import 'package:flutter/material.dart';

enum TaskStatus { pending, completed }

class TaskModel {
  String? id;
  String title;
  String description;
  TaskStatus status;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,

    // this.id=  UniqueKey().toString(),
  });
}
