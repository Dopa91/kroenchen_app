import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/colors.dart';

class BackgroundImageWidget extends StatefulWidget {
  const BackgroundImageWidget({
    super.key,
    required this.child,
    this.image = const Image(image: AssetImage("assets/images/k_logo.png")),
  });

  final Widget child;
  final Image? image;

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
          duration: const Duration(milliseconds: 30),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            gradient: isLight
                ? daerkerBackgroundColorPurpleGradient
                : backgroundColorPurpleGradient,
          ),
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Center(
            child: widget.image,
          ),
        ),
        Positioned.fill(child: widget.child),
      ],
    );
  }
}
