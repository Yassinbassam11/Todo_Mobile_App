// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:todo_starter/screens/todo_screen.dart';
import 'package:todo_starter/widgets/custom_button.dart';
import 'package:todo_starter/widgets/custom_texfield.dart';
import 'package:todo_starter/screens/signup_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                    'WELCOME BACK',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sign in to continue using our app",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
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
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.purple[800],
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomButton(
                    text: 'Sign In',
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Handle sign in logic
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
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
                          switch (e.code.toString()) {
                            case 'user-not-found':
                              message =
                                  'No account found with this email. Please sign up first.';
                              break;
                            case 'wrong-password':
                              message = 'Incorrect password. Please try again.';
                              break;
                            case 'invalid-email':
                              message = 'Please enter a valid email address.';
                              break;
                            case 'user-disabled':
                              message = 'This account has been disabled.';
                              break;
                            case 'invalid-credential':
                              message =
                                  'Invalid email or password. Please check your credentials and try again.';
                              break;
                            default:
                              message = 'Sign in failed: ${e.message}';
                          }

                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(message)));
                        } catch (e) {
                          // Handle errors here, e.g., show a snackbar
                        }
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  Text.rich(
                    TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
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
                                  builder: (context) => SignupScreen(),
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
