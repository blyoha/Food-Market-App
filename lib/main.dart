import 'package:flutter/material.dart';

import 'di/injection.dart';

void main() {
  Locator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Market App',
      debugShowCheckedModeBanner: false,
      // home: ,
    );
  }
}
