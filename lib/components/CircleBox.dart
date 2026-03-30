import 'package:flutter/material.dart';


class Circlebox extends StatelessWidget {
  const Circlebox({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 42,
      backgroundColor: Colors.purple,
    );
  }
}
