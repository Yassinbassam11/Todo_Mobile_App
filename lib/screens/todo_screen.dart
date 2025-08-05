import 'package:flutter/material.dart';
import 'package:todo_starter/widgets/task.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Todo List', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.purple[800],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 12),
              TaskWidget(
                title: "Read a book",
                description: "Read 'The Great Gatsby'",
                status: TaskStatus.completed,
              ),
              TaskWidget(
                title: "Write a blog post",
                description: "Write about Flutter state management",
                status: TaskStatus.pending,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
