import 'package:flutter/material.dart';

class OtpBox extends StatelessWidget {
  TextEditingController controller=TextEditingController();
   OtpBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 60,
      decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(5)),
    );
  }
}
