import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:loginprojectcontroller3/pages/home_page.dart';


void main() async {
  await Hive.initFlutter();
  await Hive.openBox("baza1");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
