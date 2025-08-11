import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_starter/main.dart';
import 'package:todo_starter/models/task_model.dart';
import 'package:todo_starter/screens/signin_screen.dart';
import 'package:todo_starter/widgets/custom_button.dart';
import 'package:todo_starter/widgets/custom_texfield.dart';
import 'package:todo_starter/widgets/task._item.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void loadTaks() {
    // Load tasks from the appBrain
    appBrain.getTasks();
    setState(() {});
  }

  @override
  void initState() {
    loadTaks();
    super.initState();
  }

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
              appBrain.removeAllTasks();
              setState(() {});
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
              final task = appBrain.tasks[index];
              return TaskWidget(
                model: task,
                emptyFun: () {
                  if (task.id != null) {
                    appBrain.removeTask(task.id!);
                    setState(() {});
                  }
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[800],
        shape: const CircleBorder(),
        onPressed: () {
          // Add new task logic here
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "Add New Task",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[800],
                          ),
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: _titleController,
                          keyboardType: TextInputType.text,
                          hintText: "Enter task title",
                          prefixIcon: IconButton(
                            icon: Icon(Icons.title),
                            onPressed: () {},
                          ),
                        ),
                        CustomTextField(
                          controller: _descriptionController,
                          keyboardType: TextInputType.text,
                          hintText: "Enter task description",
                          prefixIcon: IconButton(
                            icon: Icon(Icons.description),
                            onPressed: () {},
                          ),
                        ),
                        CustomButton(
                          text: "Add Task",
                          onPressed: () {
                            appBrain.addTask(
                              TaskModel(
                                id: UniqueKey().toString(),
                                title: _titleController.text,
                                description: _descriptionController.text,
                                status: TaskStatus.pending,
                              ),
                            );
                            // appBrain.addTaskToFirestore(
                            //   TaskModel(
                            //     title: _titleController.text,
                            //     description: _descriptionController.text,
                            //     status: TaskStatus.pending,
                            //   ),
                            // );
                            _titleController.clear();
                            _descriptionController.clear();
                            Navigator.of(context).pop();
                            setState(() {});
                          },
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            // Logic to cancel the task addition
                            _titleController.clear();
                            _descriptionController.clear();
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Colors.purple[800],
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       title: Text('Add New Task'),
          //       content: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           TextField(
          //             controller: _titleController,
          //             decoration: InputDecoration(labelText: 'Task Title'),
          //           ),
          //           TextField(
          //             controller: _descriptionController,
          //             decoration: InputDecoration(labelText: 'Description'),
          //           ),
          //         ],
          //       ),
          //       actions: [
          //         TextButton(
          //           onPressed: () {
          //             Navigator.of(context).pop();
          //           },
          //           child: Text('Cancel'),
          //         ),
          //         ElevatedButton(
          //           onPressed: () {
          //             // Logic to add the task
          //             appBrain.addTask(
          //               TaskModel(
          //                 title: _titleController.text,
          //                 description: _descriptionController.text,
          //                 status: TaskStatus.pending,
          //               ),
          //             );
          //             _titleController.clear();
          //             _descriptionController.clear();
          //             Navigator.of(context).pop();
          //             setState(() {});
          //           },
          //           child: Text('Add Task'),
          //         ),
          //       ],
          //     );
          //   },
          // );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
