import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_muneyyem_vi/AllData.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String name, mobile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Home Page"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Name",
              ),
              onChanged: (input) {
                name = input;
              },
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "mobile",
              ),
              onChanged: (input) {
                mobile = input;
              },
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                Firestore.instance.collection("User").add({
                  "name": name,
                  "mobile": mobile,
                });
              });
            },
            child: Text("Send Data"),
            color: Colors.green,
            splashColor: Colors.red,
          ),
          SizedBox(
            height: 20.0,
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllData()),
                );
              });
            },
            child: Text("Get Data"),
            color: Colors.green,
            splashColor: Colors.teal,
          ),
          SizedBox(
            height: 20.0,
          ),
          FlatButton(
            onPressed: () {
              setState(() {});
            },
            child: Text("Log Out"),
            color: Colors.green,
            splashColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
