import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/colors.dart';

class SignUpIconButton extends StatelessWidget {
  const SignUpIconButton({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: buttonBlue,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            36,
          ),
        ),
      ),
      child: IconButton(
        onPressed: null,
        icon: Icon(
          icon,
          size: 36,
          color: brighterPurple,
        ),
      ),
    );
  }
}
