import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_starter/main.dart';
import 'package:todo_starter/models/task_model.dart';
import 'package:todo_starter/screens/signin_screen.dart';
import 'package:todo_starter/widgets/task.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'Todo List',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[800],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Add delete task logic here
            },
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              // Add new task logic here
              try {
                // Sign out the user
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SigninScreen()),
                  (route) => false,
                ); // Navigate back to sign-in screen
              } catch (e) {
                print("Error signing out: $e");
              }
            },
          ),
        ],
      ),
      body: Center(
        child: SafeArea(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 12),
            //physics: BouncingScrollPhysics(),
            itemCount: appBrain
                .tasks
                .length, // Example count, replace with your task list length
            itemBuilder: (context, index) {
              return TaskWidget(model: appBrain.tasks[index]);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[800],
        shape: const CircleBorder(),
        onPressed: () {
          // Add new task logic here
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add New Task'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Task Title'),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Description'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Logic to add the task
                      Navigator.of(context).pop();
                    },
                    child: Text('Add Task'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
