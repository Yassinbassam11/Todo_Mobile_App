import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:todo_starter/screens/signin_screen.dart';
// ignore: unused_import
import 'package:todo_starter/screens/signup_screen.dart';

import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'package:todo_starter/screens/todo_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SigninScreen(),
    );
  }
}
