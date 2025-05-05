import 'package:flutter/material.dart';
import 'package:qr_code_scanner_and_generator/generate_qr_code.dart';
import 'package:qr_code_scanner_and_generator/scan_qr_code.dart';
import 'package:qr_code_scanner_and_generator/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner and Generator'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Button(
              onTap: () {
                print('Scan OR Code');
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ScanQrCode()),
                  (route) => true,
                );
              },
              text: 'Scan QR Code',
            ),
            SizedBox(height: 20),
            Button(
              onTap: () {
                print('Generate OR Code');
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => GenerateQrCode()),
                  (route) => true,
                );
              },
              text: 'Generate QR Code',
            ),
          ],
        ),
      ),
    );
  }
}
