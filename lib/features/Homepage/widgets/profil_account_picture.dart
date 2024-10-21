import 'package:flutter/material.dart';

class ProfilAccountPicture extends StatelessWidget {
  const ProfilAccountPicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 60,
      backgroundImage: AssetImage("assets/images/bober.jpg"),
    );
  }
}
