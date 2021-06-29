import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllData extends StatefulWidget {
  const AllData({Key? key}) : super(key: key);

  @override
  _AllDataState createState() => _AllDataState();
}

class _AllDataState extends State<AllData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("All Data"),
        ),
        body: StreamBuilder(
          stream: Firestore.instance.collection("User").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Text("No Value");
            }
            return ListView(
              children: snapshot.data!.documents.map((docs) {
                return Column(
                  children: [
                    Text(docs['Name'] ?? " "),
                    Text(docs['mobile'] ?? " "),
                  ],
                );
              }).toList(),
            );
          },
        ));
  }
}
