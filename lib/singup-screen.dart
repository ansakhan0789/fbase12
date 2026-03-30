import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
 bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextFormField(controller: emailController,),
        TextFormField(controller: passwordController,),
       isLoading==true?CircularProgressIndicator():
        TextButton(onPressed: ()async{
          isLoading=true;
          setState(() {

          });
         await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text).then((value){
                isLoading=false;
                setState(() {

                });
         }).
         // run for error
         onError((error,handleError){
           isLoading=false;
           setState(() {

           });
         });
        }, child: Text('Signup'))
      ],),
    );
  }
}
