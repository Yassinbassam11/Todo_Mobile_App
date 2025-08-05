// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:todo_starter/screens/signin_screen.dart';
import 'package:todo_starter/screens/todo_screen.dart';
import 'package:todo_starter/widgets/custom_texfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 100,
                    color: Colors.purple[800],
                  ),
                  Text(
                    'Create Account',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sign up to get started with with our app",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: fullNameController,
                    keyboardType: TextInputType.name,
                    prefixIcon: IconButton(
                      icon: Icon(Icons.person),
                      onPressed: null,
                    ),
                    hintText: 'Full Name',
                  ),
                  CustomTextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: IconButton(
                      icon: Icon(Icons.email),
                      onPressed: null,
                    ),
                    hintText: 'Email',
                    validator: (emailController) {
                      if (!emailController!.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: IconButton(
                      icon: Icon(Icons.lock),
                      onPressed: null,
                    ),
                    suffixIcon: IconButton(
                      icon: isObscure
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: () {
                        // Toggle visibility logic can be added here
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    ),
                    hintText: 'Password',
                    isObscureText: isObscure,
                  ),
                  CustomTextField(
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: IconButton(
                      icon: Icon(Icons.lock),
                      onPressed: null,
                    ),
                    suffixIcon: IconButton(
                      icon: isObscure
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: () {
                        // Toggle visibility logic can be added here
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    ),
                    hintText: 'Confirm Password',
                    validator: (confirmPasswordController) {
                      if (confirmPasswordController !=
                          passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    isObscureText: isObscure,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                // Process the sign-up
                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                        email: emailController.text,
                                        password:
                                            confirmPasswordController.text,
                                      );
                                  FirebaseAuth.instance.currentUser!
                                      .updateDisplayName(
                                        fullNameController.text,
                                      );
                                  // Navigate to the todo screen or home screen
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TodoScreen(),
                                    ),
                                    (route) => false,
                                  );
                                } on FirebaseAuthException catch (e) {
                                  String message;
                                  switch (e.code) {
                                    case 'email-already-in-use':
                                      message =
                                          'This email is already registered. Please sign in instead.';
                                      break;
                                    case 'weak-password':
                                      message =
                                          'Password is too weak. Please use at least 6 characters.';
                                      break;
                                    case 'invalid-email':
                                      message =
                                          'Please enter a valid email address.';
                                      break;
                                    default:
                                      message =
                                          'Registration failed: ${e.message}';
                                  }

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(message)),
                                  );
                                } catch (e) {
                                  // Handle errors here, e.g., show a snackbar
                                  print("An error has occured ${e.toString()}");
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple[800],
                              padding: EdgeInsets.symmetric(
                                horizontal: 30.0,
                                vertical: 12.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: Colors.purple[800],
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to login screen
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SigninScreen(),
                                ),
                                (route) => false,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
