import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/colors.dart';

class TextFieldBox extends StatelessWidget {
  const TextFieldBox({
    super.key,
    required this.text,
    this.controller,
    this.obscureText = false,
  });

  final String text;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: text,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: brighterPurple),
          ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
