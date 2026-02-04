import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final double iconSize;

  const AppLogo({
    super.key,
    this.size = 64,
    this.iconSize = 36,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: const Color(0xff1E2A3A),
        borderRadius: BorderRadius.circular(size * 0.22),
      ),
      child: Icon(
        Icons.local_hospital_outlined,
        color: Colors.white,
        size: iconSize,
      ),
    );
  }
}
