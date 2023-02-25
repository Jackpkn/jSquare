import 'package:flutter/material.dart';

class TextFormInput extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String hintText;
  final String labelText;
  final bool? obscureText;
  String? Function(String?)? validator;
  final TextEditingController controller;
  final Widget? icon;
  TextFormInput({
    super.key,
    required this.onSaved,
    required this.hintText,
    required this.labelText,
    required this.validator,
    required this.controller,
    this.obscureText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      controller: controller,
      onSaved: onSaved,
      validator: validator,
      // controller: userInput,
      style: const TextStyle(
        fontSize: 17,
        color: Colors.blue,
        fontWeight: FontWeight.w600,
      ),
      onChanged: (value) {},
      decoration: InputDecoration(
        suffixIcon:  icon,
        labelStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
        // focusedBorder: const OutlineInputBorder(
        //   borderSide:
        //       BorderSide(color: Color.fromARGB(255, 36, 15, 10), width: 2),
        // ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 26, 10, 7), width: 1),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFee7b64), width: 2),
        ),
        focusColor: Colors.white,
        //add prefix icon
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),

        // focusedBorder: OutlineInputBorder(
        //   borderSide: const BorderSide(color: Colors.blue, width: 1.0),
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        fillColor: Colors.grey,

        hintText: hintText,

        //make hint text
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontFamily: "verdana_regular",
          fontWeight: FontWeight.w400,
        ),

        //create lable
        labelText: labelText,
      ),
    );
  }
}
