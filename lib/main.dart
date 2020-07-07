import 'package:flutter/material.dart';
import 'package:internship_gh/resource/auth_provider.dart';
import 'package:internship_gh/ui/auth/forget_dart.dart';
import 'package:internship_gh/ui/auth/login_screen.dart';
import 'package:internship_gh/ui/auth/signup_screen.dart';
import 'package:internship_gh/ui/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var authProvider = CallAuthenticationAPI();
  var data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Name',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.black,
          primaryIconTheme: IconThemeData(color: Colors.black),
          primaryTextTheme: TextTheme(
              headline6: TextStyle(color: Colors.black, fontFamily: "Nunito")),
          textTheme: TextTheme(headline6: TextStyle(color: Colors.black))),
      home: HomeScreen(),
      routes: {
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/forget': (context) => ForgetPage(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
