import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_starter/app_brain.dart';
// ignore: unused_import
import 'package:todo_starter/screens/signin_screen.dart';
// ignore: unused_import
import 'package:todo_starter/screens/signup_screen.dart';

import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'package:todo_starter/screens/todo_screen.dart';

final AppBrain appBrain = AppBrain();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: SigninScreen(),
      home: FirebaseAuth.instance.currentUser != null
          ? const TodoScreen()
          : const SigninScreen(),
    );
  }
}
