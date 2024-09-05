import 'package:flutter/material.dart';

/// Default Controller
///
/// Uma interface simples para controladores.
abstract class DefaultController extends ChangeNotifier {
  /// Notifica todos os ouvites registrados, simplifica notifyListeners.
  void notify() => notifyListeners();

  void reset();
}
