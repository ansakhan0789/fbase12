import 'package:fbase12/components/CircleBox.dart';
import 'package:fbase12/components/black_text.dart';
import 'package:fbase12/components/grey_text.dart';
import 'package:fbase12/components/otp_box.dart';
import 'package:fbase12/components/purple_text.dart';
import 'package:fbase12/components/text_button.dart';
import 'package:fbase12/screen_3.dart';
import 'package:flutter/material.dart';


class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
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
             decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(15),),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Circlebox(),
                  SizedBox(height: 10,),
                  BlackText(text: 'Check Your Email'),
                  SizedBox(height: 8,),
                  GreyText(text: 'Check Your Email we send To'),
                  SizedBox(height: 3,),
                  PurpleText(text: 'dan@moonward.com below'),
                  SizedBox(height: 35,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OtpBox(),
                      OtpBox(),
                      OtpBox(),
                      OtpBox(),
                      OtpBox(),
                      OtpBox(),
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GreyText(text: 'Donot Receive It?'),
                        SizedBox(width: 5,),
                        PurpleText(text: 'Send Again')
                      ],
                    ),
                  ),
                //  SizedBox(height: 7,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GreyText(text: 'Resend Code'),
                      SizedBox(width: 5,),
                      PurpleText(text: '00:39s')
                    ],
                  ),
                  SizedBox(height: 20,),
                  PurpleButton(ontap: (){Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen3(),
                    ),
                  );}, buttonText: 'Next')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
