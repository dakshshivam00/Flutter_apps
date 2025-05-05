import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/services.dart';

class ScanQrCode extends StatefulWidget {
  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String qrCode = "Scan a QR code";
  bool isScanning = true;
  final MobileScannerController controller = MobileScannerController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mobile QR Scanner")),
      body: Column(
        children: [
          if (isScanning)
            Expanded(
              flex: 3,
              child: MobileScanner(
                controller: controller,
                onDetect: (capture) {
                  final barcode = capture.barcodes.first;
                  setState(() {
                    qrCode = barcode.rawValue ?? "Failed to scan";
                    isScanning = false;
                    controller.stop();
                  });
                },
              ),
            ),
          Expanded(
            flex: 1,
            child: Center(
              child: GestureDetector(
                onLongPress: () {
                  Clipboard.setData(ClipboardData(text: qrCode));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Copied to clipboard')),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Scanned Code: ",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: qrCode,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "\n\n(Long press to copy)",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
