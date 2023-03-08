import 'package:flutter/material.dart';
import 'package:mart_8_calismalar/login_page.dart';
import 'package:mart_8_calismalar/register_page.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      // theme: ThemeData.dark(
      //   useMaterial3: false,
      // ),
      theme: ThemeData(useMaterial3: true),
      home: MyLoginPage(),
    );
  }
}
