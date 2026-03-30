import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class INsertData extends StatefulWidget {
  const INsertData({super.key});

  @override
  State<INsertData> createState() => _INsertDataState();
}

class _INsertDataState extends State<INsertData> {
  TextEditingController nameCOntroller=TextEditingController();
  TextEditingController ageCOntroller=TextEditingController();
  bool isLaoding=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextFormField(controller: nameCOntroller,),
        TextFormField(controller: ageCOntroller,),
        isLaoding?CircularProgressIndicator(): TextButton(onPressed: ()async{
          isLaoding=true;
          setState(() {

          });
          String docId=DateTime.now().microsecondsSinceEpoch.toString();
          await FirebaseFirestore.instance.collection('insert-dataa').doc(docId).
          // it mernas auto generate doc id
          set({
            //MAP data type
            // key : valye
            // field: value
            // String : dynamic
            'name':nameCOntroller.text,
            'age':ageCOntroller.text,
            'docid':docId
          //  'fname':nameCOntroller.text
          }).then((onValue){
            isLaoding=false;
            nameCOntroller.clear();
            ageCOntroller.clear();
            setState(() {

            });
            Navigator.pop(context);
          }).onError((error,handleError){
            isLaoding=false;
            setState(() {

            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error:$error')));
          });
        }, child: Text('Add-Data'))
      ],),
    );
  }
}
