import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:internship_gh/resource/auth_provider.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _studentRef = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  ProgressDialog pr;

  String message = '';

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(
      context,
      isDismissible: false,
      showLogs: true,
    );
    pr.style(message: 'Please wait...');

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/images/logo.png'),
      ),
    );
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 44.0),
              Text(
                message,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontFamily: 'Nunito',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 14.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Student ID',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
                controller: _studentRef,
                validator: (value) {
                  if (value.isEmpty) return 'Please enter a valid Student ID';
                  return null;
                },
              ),
              SizedBox(height: 8.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Email',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
                controller: _email,
                validator: (value) {
                  if (value.isEmpty || !value.contains("@"))
                    return 'Please enter a valid email';

                  return null;
                },
              ),
              SizedBox(height: 8.0),
              TextFormField(
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
                controller: _password,
                validator: (value) {
                  if (value.isEmpty) return 'Please enter a valid password';
                  return null;
                },
              ),
              SizedBox(height: 8.0),
              TextFormField(
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
                controller: _confirmPassword,
                validator: (value) {
                  if (value.isEmpty) return 'Please enter a valid password';
                  if (value != _password.text) return "Passwords don't match";
                  return null;
                },
              ),
              SizedBox(height: 24.0),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _handleRegistration();
                      pr.show();
                    }
                  },
                  padding: EdgeInsets.all(12),
                  color: Colors.lightBlueAccent,
                  child: Text('Sign Up', style: TextStyle(color: Colors.white)),
                ),
              ),
              FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already have an account? ',
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text(
                      ' Log In',
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleRegistration() async {
    try {
      var data = {
        'first_name': 'a',
        'last_name': 'a',
        'student_ref': _studentRef.text,
        'email': _email.text,
        'password': _password.text,
        'confirm_password': _confirmPassword.text,
      };
      var res = await CallAuthenticationAPI().postData(data, 'register');
      var body = json.decode(res.body);
      if (body['message'] == 'success') {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', body['token']);
        localStorage.setString('user', json.encode(body['user']));
        setState(() {
          message = '';
          Future.delayed(Duration(microseconds: 10)).then((value) => pr
              .hide()
              .whenComplete(
                  () => Navigator.pushReplacementNamed(context, '/home')));
        });
      } else {
        setState(() {
          Future.delayed(Duration(seconds: 2)).then((value) => pr
              .hide()
              .whenComplete(() => showToast(
                  "Oops, An error occured, try agian later",
                  gravity: Toast.CENTER,
                  duration: 3)));
        });
      }
    } catch (e) {
      setState(() {
        Future.delayed(Duration(seconds: 2)).then((value) => pr
            .hide()
            .whenComplete(() => showToast("Network connection down",
                gravity: Toast.CENTER, duration: 3)));
      });
    }
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
