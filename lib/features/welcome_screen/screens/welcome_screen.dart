import 'package:flutter/material.dart';
import 'package:kroenchen_app/features/welcome_screen/widgets/welcome_screen_content.dart';
import 'package:kroenchen_app/shared/widgets/background_image_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      child: Scaffold(
        body: WelcomeScreenContent(),
      ),
    );
  }
}
