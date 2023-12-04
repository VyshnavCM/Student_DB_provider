import 'package:flutter/material.dart';

class Illustration extends StatelessWidget {
  const Illustration({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height*.2,
      child: const Image(image: AssetImage('assets/images/registration_background.png')),
    );
  }
}