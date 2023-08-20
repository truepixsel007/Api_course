import 'package:flutter/material.dart';
import 'package:fluter_demo/home_page.dart';
import 'package:fluter_demo/example_two.dart';
import 'package:fluter_demo/example_fiver.dart';
// import 'package:fluter_demo/signup.dart';
import 'package:fluter_demo/login.dart';
import 'package:fluter_demo/upload_image.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({Key? key}) :super (key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(),
        body: UploadImageScreen(),
      ),
    );
  }
}
