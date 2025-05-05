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

  void _showQRDialog() {
    if (_urlController.text.isEmpty) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.all(20),
        content: Container(
          width: 300, // Fixed width for the dialog
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 200,
                height: 200,
                child: QrImageView(
                  data: _urlController.text,
                  size: 200,
                  version: QrVersions.auto,
                  gapless: false,
                  errorStateBuilder: (context, error) {
                    return Center(
                      child: Text(
                        'Error generating QR code: $error',
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                _urlController.text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Back'),
          ),
        ],
      ),
    );
  }

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
              CustomTextField(
                text: 'Enter your data',
                urlController: _urlController,
              ),
              SizedBox(height: 20),
              Button(
                onTap: _showQRDialog,
                text: 'Generate QR',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
