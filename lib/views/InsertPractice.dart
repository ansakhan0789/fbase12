import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class InsertPractice extends StatefulWidget {
  const InsertPractice({super.key});

  @override
  State<InsertPractice> createState() => _InsertPracticeState();
}

class _InsertPracticeState extends State<InsertPractice> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  bool isLaoding = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              width: 280,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 280,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(
                    hintText: "Enter your age",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 7),
            isLaoding
                ? CircularProgressIndicator()
                : TextButton(
                    onPressed: () async {
                      isLaoding = true;
                      setState(() {});
                      await FirebaseFirestore.instance
                          .collection('insert-data')
                          .add({
                            'name': nameController.text,
                            'age': ageController.text,
                          })
                          .then((onValue) {
                            isLaoding = false;
                            nameController.clear();
                            ageController.clear();
                            setState(() {});
                          })
                          .onError((error, handleError) {
                            isLaoding = false;
                            setState(() {});
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error:$error')),
                            );
                          });
                    },
                    child: Text('Add-Data'),
                  ),
          ],
        ),
      ),
    );
  }
}
