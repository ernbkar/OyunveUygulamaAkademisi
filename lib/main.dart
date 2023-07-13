import 'package:flutter/material.dart';
import 'package:memapp/pages/profilepage.dart';
import 'package:memapp/pages/loginpage.dart';
import 'package:memapp/pages/registerpage.dart';
import 'package:memapp/pages/samplepage.dart';
void main() {
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
          home: RegisterPage(),
          debugShowCheckedModeBanner: false,
          );
  }}