// ignore_for_file: unused_local_variable

import 'package:hive_flutter/adapters.dart';

Future<void> helloStudent() async {
  final students = await Hive.openBox('students_data');
  
}