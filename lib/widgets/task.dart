import 'package:flutter/material.dart';

enum TaskStatus { pending, completed }

TaskStatus status = TaskStatus.pending;
String title = "";
String description = "";

// ignore: must_be_immutable
class TaskWidget extends StatefulWidget {
  TaskWidget({
    super.key,
    required this.title,
    required this.description,
    this.status = TaskStatus.pending,
  });

  String title;
  String description;
  TaskStatus status;

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
                if (widget.status == TaskStatus.pending) {
                  status = TaskStatus.completed;
                } else if (widget.status == TaskStatus.completed) {
                  status = TaskStatus.pending;
                }
                widget.status = status;
              });
            },
            icon: widget.status == TaskStatus.completed
                ? Icon(Icons.check_circle, color: Colors.purple[800])
                : Icon(Icons.circle_outlined),
          ),
          Column(
            children: [
              Text(
                widget.title.toUpperCase(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.description,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          Spacer(),
          Icon(Icons.more_vert, color: Colors.grey),
        ],
      ),
    );
  }
}
