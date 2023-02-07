import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future <ScanModel> nuevoScan ( String valor ) async{
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    nuevoScan.id=id;
    if (this.tipoSeleccionado == nuevoScan.tipo) {
      this.scans.add(nuevoScan);
      notifyListeners();
    }
    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getAllScan();
    this.scans = [...?scans];
    notifyListeners();

  }

  cargarScansPortipo(String tipo) async{
    final scans = await DBProvider.db.getAllScanByType(tipo);
    this.scans = [...?scans];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async{
    DBProvider.db.deleteAllScan();
    this.scans=[];
    notifyListeners();
  }

  borrarScanPorId(int id) async{
    DBProvider.db.deleteScan(id);
    //this.cargarScansPortipo(this.tipoSeleccionado);
  }
}