import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fbase12/views/insert-data.dart';
import 'package:flutter/material.dart';

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

// CRUD
// create--- insert
// read-- fetching data
class _FetchDataState extends State<FetchData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => INsertData()),
          );
        },
      ),
      // stream->old data + new data
      //Future.builder
      body: StreamBuilder(
        //---->source of incoming data
        stream: FirebaseFirestore.instance
            .collection('insert-dataa')
            .snapshots(),
        // .snapshot--object---:access / reference of class
        //--->
        builder: (context, snapshot) {
          return ListView.builder(
            // list listname.lenght
            itemCount: snapshot.data!.docs.length, // total counts
            itemBuilder: (context, index) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text(
                    "No Data Available",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                );
              }

              return ListTile(
                onLongPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateData(
                        docid: snapshot.data!.docs[index]['docid'],
                      ),
                    ),
                  );
                },
                onTap: () async {
                  await FirebaseFirestore.instance
                      .collection('insert-dataa')
                      .doc(snapshot.data!.docs[index]['docid'])
                      .delete();
                },
                title: Text(snapshot.data!.docs[index]['name']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //    Text(snapshot.data!.docs[index]['fname']),
                    Text(snapshot.data!.docs[index]['age']),
                  ],
                ),
                trailing: Text(snapshot.data!.docs[index]['docid']),
                // trailing: Text(snapshot.data!.docs[index]['age']),
              );
            },
          );
        },
      ),
    );
  }
}

class UpdateData extends StatefulWidget {
  final String docid;
  const UpdateData({super.key, required this.docid});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(controller: nameController),
          TextFormField(controller: ageController,),
          TextButton(
            onPressed: () async {
              await FirebaseFirestore.instance
                  .collection('insert-dataa')
                  .doc(widget.docid)
                  .update({
                    'name': nameController.text,
                    'age': ageController.text,
                  })
                  .then((value) {
                    Navigator.pop(context);
                  })
                  .onError((error, handleError) {});
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }
}
