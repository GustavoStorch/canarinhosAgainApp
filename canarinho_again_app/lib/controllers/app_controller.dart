import 'package:canarinho_again_app/rounting/app_route_path.dart';
import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/app_environment.dart';
import 'package:canarinho_again_app/utils/controllers/default_controller.dart';

class AppController extends DefaultController {
  AppController();

  AppRoute _route = APP_DEFAULT_ROUTE;

  /// Retorna a rota atual do aplicativo.
  AppRoute get route => _route;

  /// Ddefine a rota do aplicativo.
  void defineRoute(AppRoute value, [bool sendNotify = true]) {
    _oldRoute = _route;
    _route = value;
    if (sendNotify) notify();
  }

  AppRoute _oldRoute = APP_DEFAULT_ROUTE;
  AppRoute get oldRoute => _oldRoute;

  AppEnvironment _appEnvironment = AppEnvironment(APP_ENVIRONMENT);

  /// Retorna o ambiente do aplicativo.
  AppEnvironment get appEnvironment => _appEnvironment;

  bool _awaitResponse = false;

  /// Retorna o estado da resposta do servidor (uso interno, ao clicar em botão async).
  bool get awaitResponse => _awaitResponse;

  /// Define o estado dos botões como false.
  void removeAwaitResponse() => _awaitResponse = false;

  /// Define o estado dos botões como true.
  void awaitingResponse() => _awaitResponse = true;

  /// Altera o ambiente do aplicativo.
  void toggleAppEnvironment([bool sendNotify = true]) {
    if (_appEnvironment.isOfficial) {
      _appEnvironment = AppEnvironment(Environment.development);
    } else if (_appEnvironment.isDevelopment) {
      _appEnvironment = AppEnvironment(Environment.test);
    } else {
      _appEnvironment = AppEnvironment(Environment.official);
    }
    if (sendNotify) notify();
  }

  @override
  void reset() {
    defineRoute(APP_DEFAULT_ROUTE);
  }
}
