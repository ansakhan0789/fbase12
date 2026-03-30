import 'package:fbase12/home-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
          Container(
            width: 300,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              controller: emailController,
              decoration:  InputDecoration(
                hintText: "Enter your email",
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.email, color: Colors.white),
              ),
            ),
          ),
            SizedBox(height: 30,),
            Container(
              width: 300,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                controller: passwordController,
                decoration:  InputDecoration(
                  hintText: "Enter your Password",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.email, color: Colors.white),
                ),
              ),
            ),

          isLoading==true?CircularProgressIndicator():
          TextButton(onPressed: ()async{
            isLoading=true;
            setState(() {

            });
            //await FirebaseAuth.instance.createUserWithEmailAndPassword
            await FirebaseAuth.instance.signInWithEmailAndPassword
            (
                email: emailController.text, password: passwordController.text)
                .then((value){isLoading=false;
              setState(() {

              });
              Navigator.pushReplacement(context, MaterialPageRoute(builder:
                  (context)=>HomeScreen()));
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
          }, child: Text('Sign-in'))
        ],),
      ),
    );
  }
}
