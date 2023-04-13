import 'package:flutter/material.dart';
import 'package:quran/Surahs.dart';
import 'package:quran/home.dart';
import 'package:quran/quranlist.dart';

import 'About.dart';
import 'audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Quranlist()),
    );
  }
}
