import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.keyboardType,
    this.prefixIcon,
    required this.hintText,
    this.isObscureText = false,
    this.suffixIcon,
    this.validator,
    super.key,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final IconButton? prefixIcon;
  final bool isObscureText;
  final String hintText;
  final IconButton? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    bool isVisibleNow = isObscureText;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          } else {
            if (validator != null) {
              return validator!(value);
            }
          }
          if (keyboardType == TextInputType.emailAddress &&
              !value.contains('@')) {
            return 'Please enter a valid email address';
          }
          return null;
        },
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isVisibleNow,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
