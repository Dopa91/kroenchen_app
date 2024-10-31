import 'package:flutter/material.dart';

class ProfilAccountPicture extends StatelessWidget {
  const ProfilAccountPicture({
    super.key,
    this.radius = 60,
  });

  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage("assets/images/bober.jpg"),
    );
  }
}
