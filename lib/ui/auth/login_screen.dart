import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:internship_gh/resource/auth_provider.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  ProgressDialog pr;

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
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 48.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _email,
                decoration: InputDecoration(
                  hintText: 'Email',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
                validator: (value) {
                  if (value.trim().isEmpty) return 'Email is required';
                  if (!value.contains('@') || !value.contains('.'))
                    return 'Please enter a valid email';
                  return null;
                },
              ),
              SizedBox(height: 8.0),
              TextFormField(
                obscureText: true,
                controller: _password,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Please enter a valid password';
                  }
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
                  padding: EdgeInsets.all(12),
                  color: Colors.lightBlueAccent,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _handlelogin();
                      pr.show();
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.black54),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/forget');
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signUp');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _handlelogin() async {
    try {
      var data = {'email': _email.text, 'password': _password.text};
      var res = await CallAuthenticationAPI().postData(data, 'login');
      var body = json.decode(res.body);
      if (body['message'] == 'success') {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', body['token']);
        localStorage.setString('user', json.encode(body['user']));
        setState(() {
          Future.delayed(Duration(microseconds: 10)).then((value) => pr
              .hide()
              .whenComplete(() => Navigator.pushNamed(context, '/home')));
        });
      } else {
        setState(() {
          Future.delayed(Duration(seconds: 2)).then((value) => pr
              .hide()
              .whenComplete(() => showToast("Invalid login attempt",
                  gravity: Toast.CENTER, duration: 3)));
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
