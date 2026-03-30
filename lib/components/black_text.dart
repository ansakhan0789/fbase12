import 'package:flutter/material.dart';

class BlackText extends StatelessWidget {
  String text;
   BlackText({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
        color: Colors.black,
        fontSize: 23,
        fontWeight: FontWeight.bold),
    );
  }
}
