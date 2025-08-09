// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:todo_starter/screens/signin_screen.dart';
import 'package:todo_starter/screens/todo_screen.dart';
import 'package:todo_starter/widgets/custom_button.dart';
import 'package:todo_starter/widgets/custom_texfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
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
                    controller: _fullNameController,
                    keyboardType: TextInputType.name,
                    prefixIcon: IconButton(
                      icon: Icon(Icons.person),
                      onPressed: null,
                    ),
                    hintText: 'Full Name',
                  ),
                  CustomTextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: IconButton(
                      icon: Icon(Icons.email),
                      onPressed: null,
                    ),
                    hintText: 'Email',
                    validator: (_emailController) {
                      if (!_emailController!.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    controller: _passwordController,
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
                    controller: _confirmPasswordController,
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
                    validator: (_confirmPasswordController) {
                      if (_confirmPasswordController !=
                          _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    isObscureText: isObscure,
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    text: "Sign Up",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Process the sign-up
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _confirmPasswordController.text,
                              );
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .set({
                                'fullName': _fullNameController.text,
                                'email': _emailController.text,
                              });
                          FirebaseAuth.instance.currentUser!.updateDisplayName(
                            _fullNameController.text,
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
                              message = 'Please enter a valid email address.';
                              break;
                            default:
                              message = 'Registration failed: ${e.message}';
                          }

                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(message)));
                        } catch (e) {
                          // Handle errors here, e.g., show a snackbar
                          print("An error has occured ${e.toString()}");
                        }
                      }
                    },
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
