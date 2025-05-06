import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslator extends StatefulWidget {
  const LanguageTranslator({super.key});

  @override
  State<LanguageTranslator> createState() => _LanguageTranslatorState();
}

class _LanguageTranslatorState extends State<LanguageTranslator> {
  var languages = ['Hindi', 'English', 'Sanskrit'];

  var originLanguage = 'From';
  var destinationLanguage = 'To';
  var output = '';
  TextEditingController languageController = TextEditingController();

  void translate(String src, String destination, String input) async {
    GoogleTranslator translator = new GoogleTranslator();
    var translation = await translator.translate(
      input,
      from: src,
      to: destination,
    );
    setState(() {
      output = translation.text.toString();
    });
    if (src == '--' || destination == '--') {
      setState(() {
        output = 'Failed to translate';
      });
    }
  }

  String getLanguageCode(String lang) {
    if (lang == 'English') {
      return 'en';
    } else if (lang == 'Hindi') {
      return 'hi';
    } else if (lang == 'Sanskrit') {
      return 'sa';
    }
    return '--';
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWith = screenWidth > 800 ? screenWidth * 0.4 : screenWidth;
    return Scaffold(
      backgroundColor: const Color.fromARGB(210, 50, 48, 48),
      appBar: AppBar(
        title: Text(
          'Language Translator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(210, 43, 40, 40),
        elevation: 0,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: cardWith,
            child: Card(
              elevation: 10,
              color: const Color.fromARGB(169, 26, 24, 24),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        DropdownButton(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          dropdownColor: Colors.white,
                          iconEnabledColor: Colors.white,
                          focusColor: Colors.white,
                          hint: Text(
                            originLanguage,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          icon: Icon(Icons.keyboard_arrow_down),
                          items:
                              languages.map((String item) {
                                return DropdownMenuItem(
                                  child: Text(item),
                                  value: item,
                                );
                              }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              originLanguage = value!;
                            });
                          },
                        ),
                        Icon(
                          Icons.arrow_right_alt_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                        DropdownButton(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          dropdownColor: Colors.white,
                          iconEnabledColor: Colors.white,
                          focusColor: Colors.white,
                          hint: Text(
                            destinationLanguage,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          icon: Icon(Icons.keyboard_arrow_down),
                          items:
                              languages.map((String item) {
                                return DropdownMenuItem(
                                  child: Text(item),
                                  value: item,
                                );
                              }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              destinationLanguage = value!;
                            });
                          },
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLines: null,
                        style: TextStyle(color: Colors.white),
                        controller: languageController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter text to translate';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Enter your text to translate',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        translate(
                          getLanguageCode(originLanguage),
                          getLanguageCode(destinationLanguage),
                          languageController.text.toString(),
                        );
                      },
                      child: Text('Translate'),
                    ),
                    Text(
                      '\n$output',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
