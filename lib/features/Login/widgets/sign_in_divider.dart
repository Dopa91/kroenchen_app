import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/colors.dart';

class SignInDivider extends StatelessWidget {
  const SignInDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: brighterPurple,
            height: 2,
          ),
        ),
        const Text(" or signIn with "),
        Expanded(
          child: Container(
            color: brighterPurple,
            height: 2,
          ),
        ),
      ],
    );
  }
}
