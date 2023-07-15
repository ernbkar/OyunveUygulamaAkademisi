import 'package:flutter/material.dart';
import 'package:memapp/pages/loginpage.dart';
import 'package:memapp/pages/loginscreen.dart';
import 'package:memapp/pages/mainpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black),
        )
      ),
          home:  LoginScreen(),
          debugShowCheckedModeBanner: false,
          );
  }}