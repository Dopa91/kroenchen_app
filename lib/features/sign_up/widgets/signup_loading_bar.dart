import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/colors.dart';

class SignUpLoadingBar extends StatelessWidget {
  const SignUpLoadingBar({
    this.borderLeft = 12,
    this.heightBoxOne = 12,
    this.heightBoxTwo = 12,
    this.borderRight = 12,
    super.key,
    required this.percentageSizeOne,
    required this.percentageSizeTwo,
  });

  final double heightBoxOne;
  final int percentageSizeOne;

  final double heightBoxTwo;
  final int percentageSizeTwo;

  final double borderLeft;
  final double borderRight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: percentageSizeOne,
          child: Container(
            decoration: BoxDecoration(
              color: buttonBlue,
              borderRadius: BorderRadius.circular(24),
            ),
            height: heightBoxOne,
          ),
        ),
        Expanded(
          flex: percentageSizeTwo,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(borderRight),
              ),
            ),
            height: heightBoxTwo,
          ),
        )
      ],
    );
  }
}
