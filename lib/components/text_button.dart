import 'package:flutter/material.dart';



class PurpleButton extends StatelessWidget {
  String buttonText;
  VoidCallback ontap;
  PurpleButton({super.key, required this.ontap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 62,
        width: 327,
        decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(12)
        ),
        child: Center(child: Text(buttonText,style: TextStyle(color: Colors.white,
            fontSize: 14,fontWeight: FontWeight.bold),),),
      ),
    );
  }
}
