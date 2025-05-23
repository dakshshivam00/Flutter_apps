import 'package:flutter/material.dart';
import 'package:qr_code_scanner_and_generator/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "QR Code Scanner and Generator",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
