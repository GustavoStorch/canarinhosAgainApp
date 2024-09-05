import 'package:canarinho_again_app/utils/controllers/default_controller.dart';

/// Default Data Controller
///
/// Uma interface de dado para controladores.
abstract class DefaultDataController<T> extends DefaultController {
  List<T> _data = [];

  /// Retorna os dados.
  List<T> get data => _data;

  /// Define os dados.
  void defineData(List<T> data, [bool sendNotify = true]) {
    _data = data;
    if (sendNotify) notify();
  }

  /// Carrega os dados de forma assíncrona.
  Future<List<T>> loadDataAsync();

  @override
  void reset() => _data = [];
}
