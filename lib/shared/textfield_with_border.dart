import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/colors.dart';

class TextFieldBox extends StatelessWidget {
  const TextFieldBox({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
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
