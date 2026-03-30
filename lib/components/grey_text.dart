import 'package:flutter/material.dart';


class GreyText extends StatelessWidget {
  String text;
   GreyText({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold),);
  }
}
