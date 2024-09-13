import 'package:canarinho_again_app/utils/controllers/default_controller.dart';

class PesquisaDataController extends DefaultController {
  PesquisaDataController();
  String _filtro = "";

  /// Retorna o filtro.
  String get filtro => _filtro;

  /// Define o filtro.
  void defineFiltro(String value, [bool sendNotify = true]) {
    _filtro = value;
    if (sendNotify) notify();
  }

  @override
  void reset() {
    _filtro = "";
  }
}
