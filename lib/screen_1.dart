import 'package:fbase12/components/Icon_box.dart';
import 'package:fbase12/components/black_text.dart';
import 'package:fbase12/components/grey_text.dart';
import 'package:fbase12/components/purple_text.dart';
import 'package:fbase12/components/text_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home-screen.dart';


class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body:Column(
        children: [
          Expanded(
            flex: 30,
            child: Container(
              width: double.infinity,
             // color: Colors.purple,
            ),
          ),
          Expanded(
            flex: 70,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
              child:
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    BlackText(text: 'Welcome Back'),
                    SizedBox(height: 10,),
                    GreyText(text: 'Enter Your Details To Log Out Back InTo \n  '
                        '                  Your account'),
                    SizedBox(height: 15,),
                    Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey)
                      ),
                      child: TextFormField(
                        controller: emailController,
                        decoration:  InputDecoration(
                          hintText: "Enter your Password",
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey)
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        decoration:  InputDecoration(
                          hintText: "Enter your Password",
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock_outline_sharp, color: Colors.black),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          GreyText(text: 'Remember me'),
                          Spacer(),
                          PurpleText(text: 'Forget Password?',)
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    PurpleButton(ontap: (){}, buttonText: 'Lets Start'),
                    SizedBox(height: 10,),
                    GreyText(text: 'Or Log In With'),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconBox(image: '',),
                        SizedBox(width: 20,),
                        IconBox(image: '')
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GreyText(text: 'Donot have account?'),
                        SizedBox(width: 5,),
                        isLoading==true?CircularProgressIndicator():
                        TextButton(onPressed: ()async{
                          isLoading=true;
                          setState(() {

                          });
                          await FirebaseAuth.instance.signInWithEmailAndPassword
                            (
                              email: emailController.text, password: passwordController.text)
                              .then((value){isLoading=false;
                          setState(() {

                          });
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context)=>Screen1()));
                          }).onError((error,handleError){
                            isLoading=false;
                            print("Error:$error");
                            setState(() {

                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Error: $error"),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 10),
                              ),
                            );
                          });
                        },
                            child: Text('Sign Up',style:
                            TextStyle(color: Colors.purple),))
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
