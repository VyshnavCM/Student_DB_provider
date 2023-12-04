// ignore_for_file: unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:students_app/presentation/home_screen.dart';

import 'package:students_app/presentation/student_list/students_list.dart';

class StudentProfileView extends StatelessWidget {
  const StudentProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(112, 3, 177, 246),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 38,
              ),
              Align(
                child: Text(
                  "Student Profile",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      border: Border.all(
                          style: BorderStyle.solid,
                          width: 10,
                          color: Colors.white54),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        
                          image: FileImage(File(Student.images)),
                          fit: BoxFit.cover)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(75, 10, 10, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Name         :  ${Student.name} ",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        fontSize: 20,
                        
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(75, 10, 10, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Parent        :  ${Student.parentName}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        fontSize: 20,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(75, 10, 10, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Age             :  ${Student.age}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        fontSize: 20,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(75, 10, 10, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Mobile no  :  ${Student.mobileNumber}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        fontSize: 20,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
                child: Ink(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        color: Colors.lightBlue,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop(
                            MaterialPageRoute(
                              builder: (ctx1) => const StudentsList(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
              ),
              const SizedBox(height: 20),
              // FloatingActionButton.extended(
              //   backgroundColor: const Color.fromARGB(255, 18, 139, 195),
              //   foregroundColor: Colors.white,
              //   onPressed: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (ctx1) => const HomeScreen(),
              //       ),
              //     );
              //   },
              //   label: const Text('NEW STUDENT REGISTRATION'),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class KeyboardHider extends StatelessWidget {
  /// Creates a widget that on tap, hides the keyboard.
  const KeyboardHider({
    required this.child,
    Key? key,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}