import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_muneyyem_vi/HomePage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _rformkey = GlobalKey<FormState>();

  late String _remail, _rPassword;

  Future<void> signin() async {
    final rfromstate = _rformkey.currentState;
    if (rfromstate!.validate()) {
      rfromstate.save();

      //problem User Moneyem Vi
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _remail, password: _rPassword);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page"),
      ),
      body: Form(
        key: _rformkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                onSaved: (input) {
                  _remail = input!;
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
                  _rPassword = input!;
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
                    signin();
                  });
                },
                child: Text("Register")),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
