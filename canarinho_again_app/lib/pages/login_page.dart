// ignore_for_file: constant_identifier_names
// import 'package:flutter/foundation.dart';
import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/app_controls.dart';
import 'package:canarinho_again_app/app_injections.dart';
import 'package:canarinho_again_app/controllers/page_controllers/login_page_controller.dart';
import 'package:canarinho_again_app/models/exception/bad_request_exception.dart';
import 'package:canarinho_again_app/repositories/autenticacao/autenticacao_repository.dart';
import 'package:canarinho_again_app/rounting/app_route_path.dart';
import 'package:canarinho_again_app/utils/app/app_error.dart';
import 'package:canarinho_again_app/utils/pages/page_background.dart';
import 'package:canarinho_again_app/utils/pages/page_button.dart';
import 'package:canarinho_again_app/utils/pages/page_const.dart';
import 'package:canarinho_again_app/utils/pages/page_error.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      LoginPageControl.usuarioControl.value = "admin";
      LoginPageControl.senhaControl.value = "admin";
    }
    return PageBackground(
      barHeight: false,
      child: Center(
        child: Container(
          width: 300.0,
          height: 400.0,
          decoration: BOX_DECORATION,
          child: ReactiveForm(
            formGroup: LoginPageControl.form,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    height: 100,
                    child: Image.asset(
                        "assets/canarinhoagain/images/logo_canarinho.png",
                        scale: 1.25),
                  ),
                  ReactiveTextField(
                    formControlName: "usuario",
                    decoration: const InputDecoration(
                      labelText: "Usuário",
                      labelStyle: STYLE_171717_F14,
                      helperText: "",
                      hintText: "",
                      suffixIcon: Icon(Icons.person_rounded,
                          color: COLOR_00528C, size: 20),
                    ),
                    validationMessages: {
                      ValidationMessage.required: (control) =>
                          "Informe um usuário.",
                    },
                  ),
                  Consumer<LoginPageController>(
                    builder: (context, controller, child) {
                      return ReactiveTextField(
                        formControlName: "senha",
                        decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: STYLE_171717_F14,
                          helperText: "",
                          hintText: "",
                          suffixIcon: IconButton(
                            splashRadius: 20,
                            onPressed: LoginPageControl.togglePasswordEye,
                            icon: Icon(
                              LoginPageControl.hiddenPassword
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              color: COLOR_00528C,
                              size: 20,
                            ),
                          ),
                        ),
                        obscureText: LoginPageControl.hiddenPassword,
                        validationMessages: {
                          ValidationMessage.required: (control) =>
                              "Informe uma senha.",
                        },
                      );
                    },
                  ),
                  ReactiveFormConsumer(
                    builder: (context, form, child) {
                      return DefaultButton(
                        width: CARD_WIDTH,
                        height: 40,
                        color: COLOR_00528C,
                        onPressed: _loginAsync,
                        child: const Text("ENTRAR", style: STYLE_FEFEFE_F14),
                      );
                    },
                  ),
                  Container(height: 10),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    indent: 32,
                    endIndent: 32,
                    color: Colors.black26,
                  ),
                  Container(height: 10),
                  const Text("$APP_NAME v$APP_VERSION",
                      style: STYLE_171717_F12),
                  const Text(APP_COPYRIGHT, style: STYLE_171717_F12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _loginAsync() {
    if (AppControl.awaitResponse) {
      MensagemInfo(AWAIT_MESSAGE);
      return;
    }

    LoginPageControl.form.markAllAsTouched();

    if (LoginPageControl.usuario.isEmpty) {
      MensagemInfo("Informe o usuário!");
      return;
    }

    if (LoginPageControl.senha.isEmpty) {
      MensagemInfo("Informe a senha!");
      return;
    }

    if (LoginPageControl.form.invalid) {
      MensagemInfo("O formulário não está válido, tente novamente!");
      return;
    }

    AppControl.awaitingResponse();

    app
        .get<AutenticacaoRepository>()
        .check(LoginPageControl.usuario, LoginPageControl.senha)
        .then((ok) {
      AcessoControl.defineAutenticacao(ok);

      AppControl.defineRoute(AppRoute.menu);
    }).catchError((err) {
      if (err is BadRequestException) {
        final dynamic error = err.error["error"];
        if (error == "WrongUsernameOrPassword" ||
            error == "UsernameValidator") {
          MensagemAlerta("Usuário ou senha inválidos!", COLOR_RED, 2);
          return;
        }
      }

      SendError(ErrorType.LOGIN_ERROR, err, "", false);
    }).whenComplete(() => AppControl.removeAwaitResponse());
  }
}
