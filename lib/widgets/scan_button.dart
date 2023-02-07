import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        //print('click');
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF','CANCELAR', false, ScanMode.QR);
        //final barcodeScanRes = 'https://fernando-herrera.com';
        
        final barcodeScanRes = 'geo: 14.618237,-90.504579';
        if(barcodeScanRes == -1){
          return ;
        }
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        //final nuevoScan = scanListProvider.nuevoScan('geo: 14.618237,-90.504579');
        //print(barcodeScanRes);
        launchURL(nuevoScan, context);
      }
    );
  }
}