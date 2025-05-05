import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrCode extends StatefulWidget {
  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String qrCode = "Scan a QR code";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mobile QR Scanner")),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: MobileScanner(
              onDetect: (capture) {
                final barcode = capture.barcodes.first;
                setState(() {
                  qrCode = barcode.rawValue ?? "Failed to scan";
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(child: Text("Scanned Code: $qrCode")),
          ),
        ],
      ),
    );
  }
}
