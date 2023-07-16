// import 'dart:js';

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:students_app/database/functions/db_functions.dart';
import 'package:students_app/model/data_model.dart';
import 'package:google_fonts/google_fonts.dart';

XFile? images;

class StudentsRegister extends StatefulWidget {
  const StudentsRegister({super.key});

  @override
  State<StudentsRegister> createState() => _StudentsRegisterState();
}

class _StudentsRegisterState extends State<StudentsRegister> {
  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _mobileNumberController = TextEditingController();

  final _parentsNameController = TextEditingController();

  // ignore: non_constant_identifier_names
  final _FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(251, 15, 82, 109),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Align(
            child: Text(
              "Register student",
              textAlign: TextAlign.center,
              style: GoogleFonts.staatliches(
                  textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 30,
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _FormKey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      images = null;
                      uploadImage(context);
                    },
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/download.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your  full name';
                      } else {
                        return null;
                      }
                    },
                    controller: _nameController,
                    decoration: InputDecoration(
                      // labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 71, 66, 66)),
                      fillColor: Colors.white70,
                      hintText: 'Student name',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your  full name';
                      } else {
                        return null;
                      }
                    },
                    controller: _parentsNameController,
                    decoration: InputDecoration(
                        // labelText: 'Parent Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 71, 66, 66)),
                        fillColor: Colors.white70,
                        hintText: 'Parent name'),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age';
                      } else if (int.parse(value) > 100 ||
                          int.parse(value) < 18) {
                        return 'Please enter a valid age';
                      } else {
                        return null;
                      }
                    },
                    controller: _ageController,
                    decoration: InputDecoration(
                        // labelText: 'Age',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 71, 66, 66)),
                        fillColor: Colors.white70,
                        hintText: 'Age'),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                      RegExp regExp = RegExp(pattern);
                      if (value == null ||
                          value.isEmpty ||
                          value.length != 10) {
                        return 'Please enter mobile number';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Please enter valid mobile number';
                      }
                      return null;
                    },
                    controller: _mobileNumberController,
                    decoration: InputDecoration(
                        // labelText: 'Mobile Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 71, 66, 66)),
                        fillColor: Colors.white70,
                        hintText: 'Mobile number'),
                  ),
                  const SizedBox(height: 25),
                  FloatingActionButton.extended(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                    onPressed: () {
                      if (_FormKey.currentState!.validate()) {
                        onAddStudententButtonClicked(context);
                      }
                    },
                    // icon: Icon(Icons.save),
                    label: const Text('SUBMIT'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onAddStudententButtonClicked(context) async {
    final _name = _nameController.text.trim();

    final _age = _ageController.text.trim();

    final _mobileNumber = _mobileNumberController.text.trim();
    final _parentName = _parentsNameController.text.trim();

    if (_name.isEmpty ||
        _age.isEmpty ||
        _mobileNumber.isEmpty ||
        _parentName.isEmpty) {
      return;
    } else if (images == null) {
      imageError();
    } else {
      _FormKey.currentState!.reset;

      final _student = StudentModel(
          name: _name,
          age: _age,
          mobileNumber: _mobileNumber,
          parentName: _parentName,
          images: images!.path);

      addStudent(_student);
      images = null;
      showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
          });
          return const AlertDialog(
            backgroundColor: Colors.white,
            actions: [
              SizedBox(
                height: 30,
              ),
              Align(
                child: Text(
                  'Registration Successful',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 12, 92, 15)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          );
        },
      );
      textFeildClear();
    }
  }

  uploadImage(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: 140,
        width: double.infinity,
        child: Column(
          children: [
            ListTile(
              onTap: () async {
                Navigator.pop(context);
                images = await pickImage(ImageSource.camera);
              },
              leading: IconButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    images = await pickImage(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera_enhance)),
              title: const Text('Camera'),
            ),
            ListTile(
              onTap: () async {
                Navigator.pop(context);
                images = await pickImage(ImageSource.gallery);
              },
              leading: IconButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    images = await pickImage(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.photo)),
              title: const Text('Gallery'),
            ),
          ],
        ),
      ),
    );
  }

  imageError() {
    const snakbar = SnackBar(
      content: Text('Upload image and continue'),
      margin: EdgeInsets.all(30),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snakbar);
  }

  Future<XFile?> pickImage(ImageSource imageSource) async {
    final image = await ImagePicker().pickImage(source: imageSource);
    return image;
  }

  void textFeildClear() {
    _nameController.clear();
    _ageController.clear();
    _mobileNumberController.clear();
    _parentsNameController.clear();
  }
}
