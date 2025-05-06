import 'package:flutter/material.dart';
import 'package:language_translator/language_translator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Languange Translator',
      debugShowCheckedModeBanner: false,
      home: LanguageTranslator(),
    );
  }
}
