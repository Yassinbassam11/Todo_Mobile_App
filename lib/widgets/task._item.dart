import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:todo_starter/main.dart';
import 'package:todo_starter/models/task_model.dart';

// ignore: must_be_immutable
class TaskWidget extends StatefulWidget {
  final TaskModel model;
  VoidCallback? emptyFun;
  TaskWidget({super.key, required this.model, this.emptyFun});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (widget.model.status == TaskStatus.pending) {
                  widget.model.status = TaskStatus.completed;
                } else if (widget.model.status == TaskStatus.completed) {
                  widget.model.status = TaskStatus.pending;
                }
              });
            },
            icon: widget.model.status == TaskStatus.completed
                ? Icon(Icons.check_circle, color: Colors.purple[800], size: 30)
                : Icon(Icons.circle_outlined, size: 30, color: Colors.grey),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.model.title.toUpperCase(),
                style: TextStyle(
                  color: widget.model.status == TaskStatus.completed
                      ? Colors.grey
                      : Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: widget.model.status == TaskStatus.completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              Text(
                widget.model.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  decoration: widget.model.status == TaskStatus.completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: widget.emptyFun,
            icon: Icon(Icons.remove_circle_outline, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
