// import 'package:flutter/material.dart';

// class CustomDropDownButton extends StatefulWidget {
//   CustomDropDownButton({Key? key, required this.language}) : super(key: key);
//   String language;

//   @override
//   State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
// }

// class _CustomDropDownButtonState extends State<CustomDropDownButton> {
//   var languages = ['Hindi', 'English', 'Sanskrit'];

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton(
//       borderRadius: BorderRadius.all(Radius.circular(10)),
//       dropdownColor: Colors.white,
//       iconEnabledColor: Colors.white,
//       focusColor: Colors.white,
//       hint: Text(
//         widget.language,
//         style: TextStyle(color: Colors.white, fontSize: 20),
//       ),
//       icon: Icon(Icons.keyboard_arrow_down),
//       items:
//           languages.map((String item) {
//             return DropdownMenuItem(child: Text(item), value: item);
//           }).toList(),
//       onChanged: (String? value) {
//         setState(() {
//           widget.language = value!;
//         });
//       },
//     );
//   }
// }
