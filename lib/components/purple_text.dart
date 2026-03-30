import 'package:flutter/material.dart';

class PurpleText extends StatelessWidget {
  String text;
   PurpleText({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          color: Colors.purple,
          fontSize: 14,
          fontWeight: FontWeight.bold),);
  }
}
