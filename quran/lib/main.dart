import 'package:flutter/material.dart';
import 'package:quran/SearchQuran.dart';
import 'SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFF404040)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      // home: const SearchQuran(),
    );
  }
}
