import 'package:flutter/material.dart';
import 'package:kroenchen_app/config/colors.dart';

class MyIndividualButton extends StatelessWidget {
  const MyIndividualButton({
    super.key,
    required this.newText,
    required this.nextSite,
    required this.icon,
  });

  final IconData? icon;

  final String newText;
  final void Function()? nextSite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextSite,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: brighterPurple),
          color: buttonBlue,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            const Expanded(
              child: SizedBox(),
            ),
            Text(
              newText,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Icon(
              icon,
            ),
          ],
        ),
      ),
    );
  }
}
