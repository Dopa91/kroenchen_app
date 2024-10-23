import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/colors.dart';

class BackgroundImageWidget extends StatelessWidget {
  const BackgroundImageWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;

    return Container(
      decoration: BoxDecoration(
        color: brightness == Brightness.light
            ? darkerBackgroundColorPurple
            : backgroundColorPurple,
        image: DecorationImage(
          image: AssetImage("assets/images/k_logo.png"),
        ),
      ),
      child: child,
    );
  }
}
