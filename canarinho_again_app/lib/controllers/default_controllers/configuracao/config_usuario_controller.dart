import 'package:canarinho_again_app/models/usuario/usuario.dart';
import 'package:canarinho_again_app/utils/controllers/default_controller.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ConfigUsuarioController extends DefaultController {
  ConfigUsuarioController();

  final FormGroup _form = fb.group({
    "codUsuario": [0],
    "usuario": ["", Validators.required],
    "nome": ["", Validators.required],
    "senha": [""],
    "isAdministrador": [false],
  });

  /// Retorna o formulário.
  FormGroup get form => _form;

  /// Retorna o controle do codUsuario.
  AbstractControl get codUsuarioControl => _form.control("codUsuario");

  /// Retorna o codUsuario.
  int get codUsuario => codUsuarioControl.value ?? 0;

  /// Define o valor do codUsuario.
  void defineCodUsuario(int value, [bool sendNotify = true]) {
    codUsuarioControl.value = value;
    if (sendNotify) notify();
  }

  /// Retorna o controle do usuario.
  AbstractControl get usuarioControl => _form.control("usuario");

  /// Retorna o usuario.
  String get usuario => usuarioControl.value ?? "";

  /// Define o valor do usuario.
  void defineUsuario(String value, [bool sendNotify = true]) {
    usuarioControl.value = value;
    if (sendNotify) notify();
  }

  /// Retorna o controle do nome.
  AbstractControl get nomeControl => _form.control("nome");

  /// Retorna a nome.
  String get nome => nomeControl.value ?? "";

  void defineNome(String value, [bool sendNotify = true]) {
    nomeControl.value = value;
    if (sendNotify) notify();
  }

  /// Retorna o controle do senha.
  AbstractControl get senhaControl => _form.control("senha");

  /// Retorna a senha.
  String get senha => senhaControl.value ?? "";
  
  void defineSenha(String value, [bool sendNotify = true]) {
    senhaControl.value = value;
    if (sendNotify) notify();
  }

  /// Retorna o controle da situação.
  AbstractControl get isAdministradorControl => _form.control("isAdministrador");

  /// Retorna a situação.
  bool get isAdministrador => isAdministradorControl.value ?? 0;

  /// Define a situação.
  void defineIsAdministradorControl(bool value, [bool sendNotify = true]) {
    isAdministradorControl.value = value;
    if (sendNotify) notify();
  }

  /// Define o formulário a partir de uma área.
  void defineByUsuario(Usuario value) {
    defineCodUsuario(value.codUsuario);
    defineUsuario(value.usuario);
    defineNome(value.nome);
    defineSenha(value.senha);
    defineIsAdministradorControl(value.isAdministrador);
  }

  /// Retorna uma área a partir do formulário.
  Usuario getUsuario() {
    return Usuario(codUsuario, usuario, nome, senha, isAdministrador);
  }

  @override
  void reset() {
    codUsuarioControl.reset(value: 0);
    usuarioControl.reset(value: "");
    nomeControl.reset(value: "");
    senhaControl.reset(value: "");
    isAdministradorControl.reset(value: false);
  }
}
