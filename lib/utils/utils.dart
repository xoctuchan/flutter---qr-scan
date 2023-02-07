import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:qr_reader/model/scan_model.dart';


launchURL(ScanModel scan, BuildContext context ) async {
  final Uri url = Uri.parse(scan.valor);
  print(url);

  if( scan.tipo == 'http'){

    if(await canLaunchUrl(url)){
      await launchUrl(url);
    }else{
      throw 'Could not launch $url';
    }
  }else{
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}