import 'package:flutter/material.dart';
import 'package:qr_code_scanner_and_generator/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});

  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {
  TextEditingController _urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Generate QR Code')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_urlController.text.isNotEmpty)
                QrImageView(data: _urlController.text, size: 200),
              CustomTextField(
                text: 'Enter info',
                urlController: _urlController,
              ),
              SizedBox(height: 20),
              Button(
                onTap: () {
                  setState(() {});
                  print('share');
                },
                text: 'Generate QR',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
