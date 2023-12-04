// import 'dart:js';

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:students_app/controllers/validator/validators.dart';
import 'package:students_app/core/color/colors.dart';
import 'package:students_app/core/constants/constants.dart';
import 'package:students_app/database/functions/db_functions.dart';
import 'package:students_app/model/data_model.dart';
import 'package:students_app/presentation/registration/widget/illustration.dart';

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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
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
                              image: AssetImage("assets/avatar.jpg"),
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
                    textCapitalization: TextCapitalization.words,
                    validator: (value)=>nameValidator(value),
                    
                    controller: _nameController,
                    decoration:  const InputDecoration(
                      hintText: 'Enter name',
                      hintStyle: TextStyle(color: kGreyColor),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kMainTextColor)),
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: kMainTextColor, width: 2))),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator:(value)=>parentNameValidator(value),
                    controller: _parentsNameController,
                    decoration:  const InputDecoration(
                      hintText: 'Enter parent name',
                      hintStyle: TextStyle(color: kGreyColor),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kMainTextColor)),
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: kMainTextColor, width: 2))),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) =>ageValidator(value),
                    controller: _ageController,
                    decoration: const InputDecoration(
                      hintText: 'Enter age',
                      hintStyle: TextStyle(color: kGreyColor),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kMainTextColor)),
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: kMainTextColor, width: 2))),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value)=>mobileNumberValidator(value),
                    controller: _mobileNumberController,
                    decoration:  const InputDecoration(
                      hintText: 'Enter mobile number',
                      hintStyle: TextStyle(color: kGreyColor),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kMainTextColor)),
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: kMainTextColor, width: 2))),
                  ),
                  const SizedBox(height: 25),
                  Stack(
                    children: [
                      Column(
                        children: [
                          kHeight20,
                          Illustration(size:size ),
                        ],
                      ),
                      Row(
                        children: [
                          kWidth50,
                          kWidth10,
                          SizedBox(
                            height: 40,
                            width: 200,
                            child: FloatingActionButton.extended(
                              backgroundColor: kButtonColor,
                              foregroundColor: Colors.white,
                              onPressed: () {
                                if (_FormKey.currentState!.validate()) {
                                  onAddStudententButtonClicked(context);
                                }
                              },
                              // icon: Icon(Icons.save),
                              label: const Text('SUBMIT'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  
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
