import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/home_page.dart';
import 'package:qr_reader/pages/mapa_page.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  final Color primaryColor = Colors.deepPurple;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => new UiProvider()),
        ChangeNotifierProvider(create: ( _ ) => new ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': ( _ ) => const HomePage(),
          'mapa': ( _ ) => const MapaPage()
        },
        theme: ThemeData(
          primaryColor: primaryColor,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: primaryColor
          )
        ),
      ),
    );

  }
}