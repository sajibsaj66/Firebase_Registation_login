import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_muneyyem_vi/HomePage.dart';
import 'package:firebase_muneyyem_vi/RegisterPage.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late String _email, _Password;

  Future<void> login() async {
    final rfromstate = _formkey.currentState;
    if (rfromstate!.validate()) {
      rfromstate.save();
      //UserCredential user= await
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _Password);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Log In Page")),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                onSaved: (input) {
                  _email = input!;
                },
                validator: (input) {
                  if (input!.isEmpty) {
                    return "Please type a valid email";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                onSaved: (input) {
                  _Password = input!;
                },
                validator: (input) {
                  if (input!.length < 6) {
                    return "Please type a at least six character ";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20.0),
            FlatButton(
                color: Colors.green,
                splashColor: Colors.red,
                onPressed: () {
                  setState(() {
                    login();
                  });
                },
                child: Text("Log in ")),
            SizedBox(height: 20.0),
            FlatButton(
                color: Colors.green,
                splashColor: Colors.red,
                onPressed: () {
                  setState(() {
                    // login();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  });
                },
                child: Text("Register "))
          ],
        ),
      ),
    );
  }
}
