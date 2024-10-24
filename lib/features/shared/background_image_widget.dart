import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/colors.dart';

class BackgroundImageWidget extends StatefulWidget {
  const BackgroundImageWidget({super.key, required this.child});

  final Widget child;

  @override
  State<BackgroundImageWidget> createState() => _BackgroundImageWidgetState();
}

class _BackgroundImageWidgetState extends State<BackgroundImageWidget> {
  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(
            milliseconds: 30,
          ),
          curve: Curves.easeInOut,
          color: isLight ? backgroundColorPurple : darkerBackgroundColorPurple,
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Center(
            child: Image.asset(
              "assets/images/k_logo.png",
              width: 150,
            ),
          ),
        ),
        Positioned.fill(child: widget.child)
      ],
    );
  }
}
