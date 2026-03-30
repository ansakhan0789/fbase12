import 'package:flutter/material.dart';


class IconBox extends StatelessWidget {
  String image;
   IconBox({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5)),
      child: Image(image: AssetImage(image)),
    );
  }
}
