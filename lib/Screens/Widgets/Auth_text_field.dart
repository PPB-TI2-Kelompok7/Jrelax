import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String icon;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  AuthTextField({
    required this.icon,
    required this.controller,
    this.obscureText = false,
    this.validator,
    required String text,
    bool isPassword = true,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.start,
          textInputAction: TextInputAction.none,
          obscureText: obscureText,
          keyboardType: TextInputType.emailAddress,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            focusColor: Colors.black26,
            fillColor: const Color.fromARGB(255, 247, 247, 247),
            filled: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                child: Image.asset(icon),
              ),
            ),
            prefixIconColor: const Color.fromARGB(255, 18, 56, 114),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          validator: validator,
        ),
      ),
    );
  }
}
