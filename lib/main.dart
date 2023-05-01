import 'package:flutter/material.dart';
import 'package:translate/colors.dart';

import 'home.dart';
import 'pages/languages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: mcgpalette,
      ),
      home: const HomePage(),
      routes: {
        // '/page1': (context) => const Page1(),
        '/page2': (context) => const Page2(),
        '/page3': (context) => const Page3(),
        '/languages': (context) => const MyLanguageUI(),
      },
    );
  }
}
