import 'package:canarinho_again_app/models/acesso/acesso.dart';
import 'package:canarinho_again_app/models/autenticacao/autenticacao.dart';
import 'package:canarinho_again_app/utils/controllers/default_controller.dart';

class AcessoController extends DefaultController {
  AcessoController();

  late Autenticacao _autenticacao;

  /// Retorna a autenticação do usuário.
  Autenticacao get autenticacao => _autenticacao;

  /// Retorna o username do usuário.
  String get username => _autenticacao.usuario.usuario;

  Acesso _acesso = Acesso.usuario;

  /// Retorna o acesso do usuário.
  Acesso get acesso => _acesso;

  /// Define o acesso do usuário.
  void defineAcesso(Acesso value, [bool sendNotify = true]) {
    _acesso = value;
    if (sendNotify) notify();
  }

  bool _manutencao = false;

  /// Define o acesso como manutenção.
  void defineManutencao(bool value, [bool sendNotify = true]) {
    _manutencao = value;
    if (sendNotify) notify();
  }

  void defineAutenticacao(Autenticacao value, [bool sendNotify = true]) {
    // AppLog(Tipo.AUTENTICACAO);

    _autenticacao = value;
    if (sendNotify) notify();
  }

  bool get isConfig => username == "conf";
  bool get isUsuario => isConfig || _acesso == Acesso.usuario;
  bool get isAdministrador => isConfig || _autenticacao.usuario.isAdministrador;
  bool get isManutencao => isConfig || _manutencao;

  @override
  void reset() {
    _acesso = Acesso.usuario;
    _manutencao = false;
  }
}
