import 'package:fbase12/components/otp_box.dart';
import 'package:fbase12/practice.dart';
import 'package:fbase12/screen_1.dart';
import 'package:fbase12/screen_2.dart';
import 'package:fbase12/screen_3.dart';
import 'package:fbase12/singup-screen.dart';
import 'package:fbase12/views/InsertPractice.dart';
import 'package:fbase12/views/fetch-data.dart';
import 'package:fbase12/views/insert-data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FetchData());
  }
}

class StackClass extends StatefulWidget {
  const StackClass({super.key});

  @override
  State<StackClass> createState() => _StackClassState();
}

class _StackClassState extends State<StackClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.blue,
          ),
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50)
              )
            ),
          ),
        ],),
        Stack(children: [
          Container(
            height: 400,
            width: double.infinity,
            color: Colors.white,
          ),
          Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50)
                    ,bottomRight: Radius.circular(50)
              )
            ),
          ),
        ],),
        Stack(children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.blue,
          ),
          Container(
            height: 150,
            width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
            )
          ),
          ),
        ],)
      ],),
    );
  }
}


class NewClass extends StatefulWidget {
  const NewClass({super.key});

  @override
  State<NewClass> createState() => _NewClassState();
}

class _NewClassState extends State<NewClass> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

