import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/constants/constants.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    super.key, required this.title1, required this.title2,
  });
    final String title1;
    final String title2;


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title1,style: const TextStyle(fontSize: 15,color: Color.fromARGB(255, 68, 68, 68)),),
            kHeight5,
            Text(title2,style: const TextStyle(fontSize: 20),),
        
          ],
        ),
      ),
    );
  }
}