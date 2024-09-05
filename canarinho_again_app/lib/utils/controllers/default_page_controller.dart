
import 'package:canarinho_again_app/models/screen_behavior/screen_behavior.dart';
import 'package:canarinho_again_app/utils/controllers/default_controller.dart';

/// Default Page Controller
///
/// Uma interface para o comportamento da página para controladores.
abstract class DefaultPageController extends DefaultController {
  ScreenBehavior _behavior = ScreenBehavior.normal;

  /// Retorna o comportamento da página.
  ScreenBehavior get behavior => _behavior;

  Object? _error;

  /// Retorna a mensagem de erro da página.
  Object? get error => _error;

  /// Define o comportamento da página.
  void setBehavior(ScreenBehavior behavior, [bool sendNotify = true]) {
    _behavior = behavior;
    if (sendNotify) notify();
  }

  /// Define a mensagem de erro da página.
  void setError(Object error, [bool sendNotify = true]) {
    _error = error;
    if (sendNotify) notify();
  }

  /// Retorna `true` caso o comportamento seja `ScreenBehavior.loading`.
  bool get inLoading => _behavior == ScreenBehavior.loading;

  /// Retorna `true` caso o comportamento seja `ScreenBehavior.error`.
  bool get inError => _behavior == ScreenBehavior.error;

  @override
  void reset() {
    _behavior = ScreenBehavior.normal;
    _error = "Unknown error.";
  }
}
