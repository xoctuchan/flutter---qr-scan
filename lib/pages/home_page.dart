import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/pages/mapas_page.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/widgets/custom_navigationbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(
            onPressed: (){
              final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
              scanListProvider.borrarTodos();
            }, 
            icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    //final tempScan = new ScanModel(valor: 'http://www.google.com');
    //final intTemp = DBProvider.db.nuevoScan(tempScan);
    //DBProvider.db.getAllScan().then(print);
    //print(intTemp);
    final scanListPovider = Provider.of<ScanListProvider>(context, listen: false);


    switch (currentIndex) {
      case 0:
        scanListPovider.cargarScansPortipo('geo');
        return const MapasPage();
      case 1:
      scanListPovider.cargarScansPortipo('http');
        return const DireccionesPage();
      default:
      return const MapasPage();
    }
  }
}