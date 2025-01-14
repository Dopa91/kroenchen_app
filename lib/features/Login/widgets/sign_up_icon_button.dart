import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kroenchen_app/config/colors.dart';

class SignUpIconButton extends StatelessWidget {
  const SignUpIconButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  final IoniconsData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: brighterPurple),
        color: buttonBlue,
        borderRadius: BorderRadius.circular(36),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 36,
          color: brighterPurple,
        ),
      ),
    );
  }
}
