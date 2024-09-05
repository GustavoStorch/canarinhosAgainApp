// ignore_for_file: constant_identifier_names

import 'package:canarinho_again_app/utils/controllers/default_controller.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginPageController extends DefaultController {
  LoginPageController();

  final FormGroup _form = fb.group({
    "usuario": ["", Validators.required],
    "senha": ["", Validators.required],
  });

  /// Retorna o formulário.
  FormGroup get form => _form;

  bool _hiddenPassword = true;

  /// Retorna o comportamento de visibilidade da senha.
  bool get hiddenPassword => _hiddenPassword;

  /// Define a liberacão.
  void defineUsuario(String value, [bool sendNotify = true]) {
    usuarioControl.value = value;
    if (sendNotify) notify();
  }

  void clearPassword() {
    senhaControl.reset();
  }

  void togglePasswordEye([bool sendNotify = true]) {
    _hiddenPassword = !_hiddenPassword;
    if (sendNotify) notify();
  }

  /// Retorna o usuario do usuário.
  AbstractControl<dynamic> get usuarioControl => _form.control("usuario");
  String get usuario => usuarioControl.value ?? "";

  /// Retorna o password do usuário.
  AbstractControl<dynamic> get senhaControl => _form.control("senha");
  String get senha => senhaControl.value ?? "";

  @override
  void reset() {
    usuarioControl.reset(value: "");
    senhaControl.reset(value: "");

    _hiddenPassword = true;
  }
}
