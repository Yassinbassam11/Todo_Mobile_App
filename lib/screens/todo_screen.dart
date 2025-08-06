import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
          child: ListView.separated(
            padding: EdgeInsets.only(top: 12),
            //physics: ClampingScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(height: 0),
            itemCount: 10, // Example count, replace with your task list length
            itemBuilder: (context, index) => TaskWidget(
              title: "Read a book",
              description: "Read 'The Great Gatsby'",
              //status: TaskStatus.completed,
            ),
            // child: Column(
            //   children: [
            //     SizedBox(height: 12),
            //     TaskWidget(
            //       title: "Read a book",
            //       description: "Read 'The Great Gatsby'",
            //       status: TaskStatus.completed,
            //     ),
            //     TaskWidget(
            //       title: "Write a blog post",
            //       description: "Write about Flutter state management",
            //       status: TaskStatus.pending,
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
