// ignore_for_file: unused_local_variable

// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../../model/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_data');
  // ignore: no_leading_underscores_for_local_identifiers
  final _id = await studentDB.add(value);
  value.id = _id;
  // studentListNotifier.value.add(value);
  // studentListNotifier.notifyListeners();
  getAllStudents();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_data');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(StudentModel studentModel) async {
  final studentDB = await Hive.openBox<StudentModel>('student_data');
  studentModel.delete();
  getAllStudents();
}

Future<List<StudentModel>> searchData(String query) async {
  final studentDB = await Hive.openBox<StudentModel>('Student_data');
  final allStudents = studentDB.values.toList();

  if (query.isEmpty) {
    return allStudents;
  }

  final filteredStudents = allStudents.where((element) {
    final name = element.name.toLowerCase();
    final lowerQuery = query.toLowerCase();
    return name.contains(lowerQuery);
  }).toList();

  return filteredStudents;
}

Future<void> searchAndUpdateStudents(String query) async {
  final filteredStudents = await searchData(query);
  studentListNotifier.value = List.from(filteredStudents);
}

late StudentModel studentModel;
editstudent({
  required StudentModel studentModel,
  required String name,
  required String age,
  required String mobilePhone,
  required String parentName,
}) async {
  final studentDB = await Hive.openBox<StudentModel>('Student_data');
  studentModel.name = name;
  studentModel.age = age;
  studentModel.mobileNumber = mobilePhone;
  studentModel.parentName = parentName;
  studentModel.save();
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  studentListNotifier.notifyListeners();
}
