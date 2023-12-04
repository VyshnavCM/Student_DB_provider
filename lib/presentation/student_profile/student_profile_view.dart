// ignore_for_file: unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:students_app/core/color/colors.dart';
import 'package:students_app/core/constants/constants.dart';
// import 'package:students_app/presentation/home_screen.dart';

import 'package:students_app/presentation/student_list/students_list.dart';
import 'package:students_app/presentation/student_profile/widget/details_widget.dart';

class StudentProfileView extends StatelessWidget {
  const StudentProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Student profile',
            style: TextStyle(color: kWhiteColor),
          ),
        ),
        backgroundColor: kAppBarColor,
        automaticallyImplyLeading: false,),
      backgroundColor: kMainBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 38,
            ),
        
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20),
            //   child: Container(
            //     height: 250,
            //     width: 250,
            //     decoration: BoxDecoration(
            //         border: Border.all(
            //             style: BorderStyle.solid,
            //             width: 10,
            //             color: Colors.white54),
            //         shape: BoxShape.circle,
            //         image: DecorationImage(
        
            //             image: FileImage(File(Student.images)),
            //             fit: BoxFit.cover)),
            //   ),
            // ),
             Center(
              child: CircleAvatar(
                radius: 90,
                backgroundImage: FileImage(File(Student.images)),
              ),
            ),
            kHeight10,
            Center(
              child: Text(Student.name.toUpperCase(),style:const TextStyle(
              fontSize: 25,fontWeight: FontWeight.bold,
                        ),),
            ),
            kHeight10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // DetailCard(title1: 'Name ', title2: Student.name),
                DetailCard(title1: 'Parent Name', title2: Student.parentName),
                DetailCard(title1: 'Age', title2: Student.age),
                DetailCard(title1: 'Mobile number', title2: Student.mobileNumber),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(75, 10, 10, 0),
            //   child: Align(
            //     alignment: Alignment.topLeft,
            //     child: Text(
            //       "Name         :  ${Student.name} ",
            //       style: GoogleFonts.poppins(
            //         textStyle: const TextStyle(
            //             color: Color.fromRGBO(255, 255, 255, 1)),
            //         fontSize: 20,
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(75, 10, 10, 0),
            //   child: Align(
            //     alignment: Alignment.topLeft,
            //     child: Text(
            //       "Parent        :  ${Student.parentName}",
            //       style: GoogleFonts.poppins(
            //         textStyle: const TextStyle(
            //             color: Color.fromRGBO(255, 255, 255, 1)),
            //         fontSize: 20,
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(75, 10, 10, 0),
            //   child: Align(
            //     alignment: Alignment.topLeft,
            //     child: Text(
            //       "Age             :  ${Student.age}",
            //       style: GoogleFonts.poppins(
            //         textStyle: const TextStyle(
            //             color: Color.fromRGBO(255, 255, 255, 1)),
            //         fontSize: 20,
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(75, 10, 10, 0),
            //   child: Align(
            //     alignment: Alignment.topLeft,
            //     child: Text(
            //       "Mobile no  :  ${Student.mobileNumber}",
            //       style: GoogleFonts.poppins(
            //         textStyle: const TextStyle(
            //             color: Color.fromRGBO(255, 255, 255, 1)),
            //         fontSize: 20,
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 35),
            Center(
              child: Ink(
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: kButtonColor,
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
