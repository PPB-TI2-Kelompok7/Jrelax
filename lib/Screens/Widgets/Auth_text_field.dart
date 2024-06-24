import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:email_validator/email_validator.dart';

class AuthTextField extends StatelessWidget {
  final String text;
  final String icon;
  final TextEditingController controller;
  final String? Function(String?)?
      validator; // Tetap pertahankan sebagai parameter opsional

  AuthTextField({
    required this.text,
    required this.icon,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextFormField(
          // Ganti TextField dengan TextFormField
          controller: controller,
          textAlign: TextAlign.start,
          textInputAction: TextInputAction.none,
          obscureText: false, // Jika field password, ubah menjadi true
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
            prefixIconColor: const Color.fromARGB(255, 3, 190, 150),
            label: Text(text),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          validator: validator, // Pindahkan validator ke sini
        ),
      ),
    );
  }
}
