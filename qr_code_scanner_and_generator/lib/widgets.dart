import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({Key? key, required this.onTap, required this.text}) : super(key: key);
  final String text;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.blue),
        // minimumSize: WidgetStateProperty.all(Size(MediaQuery.of(context).size.width / 2.5 ,50)),
      ),
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key, required this.text, required this.urlController})
    : super(key: key);
  final String text;
  TextEditingController urlController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: urlController,
      decoration: InputDecoration(
        hintText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
