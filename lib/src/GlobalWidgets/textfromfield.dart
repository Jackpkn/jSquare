// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextFormInput extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool? obscureText;
  int? maxLines;

  final TextEditingController controller;
  final Widget? icon;
  String? Function(String?)? validator;
  TextFormInput({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.obscureText,
    this.icon,
    this.maxLines = 1,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      obscureText: obscureText!,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator:  validator,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.blue,
        fontWeight: FontWeight.w600,
      ),
      onChanged: (value) {},
      decoration: InputDecoration(
        suffixIcon: icon,
        labelStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 26, 10, 7), width: 1),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFee7b64), width: 2),
        ),
        focusColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        fillColor: Colors.grey,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        labelText: labelText,
      ),
    );
  }
}
