import 'package:fbase12/components/CircleBox.dart';
import 'package:fbase12/components/black_text.dart';
import 'package:fbase12/components/grey_text.dart';
import 'package:fbase12/components/text_button.dart';
import 'package:flutter/material.dart';


class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        children: [
          Expanded(
            flex: 35,
            child: Container(
            ),
          ),
          Expanded(
            flex: 65,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
              child: Column(children: [
                SizedBox(height: 10,),
                Circlebox(),
                SizedBox(height: 10,),
                BlackText(text: 'Password Update'),
                SizedBox(height: 5,),
                GreyText(text: 'Your Password has Been Successful changed'),
               SizedBox(height: 70,),
                PurpleButton(ontap: (){}, buttonText: 'Next')
              ],),
            ),
          ),
        ],
      ),
    );
  }
}
