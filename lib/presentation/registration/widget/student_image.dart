import 'package:flutter/material.dart';
import 'dart:io';

class StudentProfileImage extends StatelessWidget {
  const StudentProfileImage({super.key, required this.radius, this.image});

  final double radius;
  final File? image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: FileImage(image!),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class DefaultStudentProfileImage extends StatelessWidget {
  const DefaultStudentProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      
      radius: 60,
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage("assets/avatar.jpg"),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}