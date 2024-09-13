import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/app_controls.dart';
import 'package:canarinho_again_app/app_injections.dart';
import 'package:canarinho_again_app/controllers/default_controllers/configuracao/config_usuario_controller.dart';
import 'package:canarinho_again_app/models/usuario/usuario.dart';
import 'package:canarinho_again_app/pages/error404_page.dart';
import 'package:canarinho_again_app/pages/loading_page.dart';
import 'package:canarinho_again_app/repositories/usuario/usuario_repository.dart';
import 'package:canarinho_again_app/rounting/app_route_path.dart';
import 'package:canarinho_again_app/utils/app/app_error.dart';
import 'package:canarinho_again_app/utils/pages/page_background.dart';
import 'package:canarinho_again_app/utils/pages/page_button.dart';
import 'package:canarinho_again_app/utils/pages/page_const.dart';
import 'package:canarinho_again_app/utils/pages/page_error.dart';
import 'package:canarinho_again_app/utils/pages/page_menubar.dart';
import 'package:canarinho_again_app/utils/pages/page_menusheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ConfigModificarUsuarioPage extends StatelessWidget {
  const ConfigModificarUsuarioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBackground(
      appBar: PageMenuBar(
        title: "Modificar Usuário",
        onPressed: () => AppControl.defineRoute(AppRoute.config_usuario),
      ),
      bottomSheet: PageMenuSheet(context: context),
      child: FutureBuilder(
        future: Future.wait({}),
        builder: (context, snapshot) {
          int initialLabelIndex = ConfigUsuarioControl.isAdministrador ? 0 : 1;
          if (snapshot.inState(ConnectionState.done).hasData) {
            return Center(
              child: Card(
                elevation: PAGE_ELEVATION,
                child: Container(
                  width: CARD_WIDTH,
                  height: 390,
                  decoration: BOX_DECORATION,
                  child: ReactiveForm(
                    formGroup: ConfigUsuarioControl.form,
                    child: AutofillGroup(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Consumer<ConfigUsuarioController>(
                              builder: (context, value, child) {
                                return ReactiveTextField(
                                  autofocus: ConfigUsuarioControl.usuario.isEmpty,
                                  cursorColor: COLOR_A9ABAE,
                                  formControlName: "usuario",
                                  decoration: const InputDecoration(
                                    labelText: "Usuário",
                                    labelStyle: STYLE_171717_F16,
                                    floatingLabelStyle: STYLE_171717_F20,
                                    hintStyle: TextStyle(fontSize: 0),
                                    helperStyle: TextStyle(fontSize: 0),
                                    errorStyle: TextStyle(fontSize: 0),
                                    focusedBorder: DEFAULT_BORDER,
                                    enabledBorder: DEFAULT_BORDER,
                                    errorBorder: ERROR_BORDER,
                                    border: DEFAULT_BORDER,
                                    contentPadding: EdgeInsets.all(16),
                                  ),
                                  inputFormatters: [
                                    UpperCaseTextFormatter(),
                                  ],
                                  maxLines: 1,
                                  maxLength: 50,
                                  validationMessages: {
                                    ValidationMessage.required: (control) =>
                                        "Informe o usuário.",
                                  },
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: ReactiveTextField(
                                cursorColor: COLOR_A9ABAE,
                                formControlName: "nome",
                                decoration: const InputDecoration(
                                  labelText: "Nome",
                                  labelStyle: STYLE_171717_F16,
                                  floatingLabelStyle: STYLE_171717_F20,
                                  hintStyle: TextStyle(fontSize: 0),
                                  helperStyle: TextStyle(fontSize: 0),
                                  errorStyle: TextStyle(fontSize: 0),
                                  focusedBorder: DEFAULT_BORDER,
                                  enabledBorder: DEFAULT_BORDER,
                                  errorBorder: ERROR_BORDER,
                                  border: DEFAULT_BORDER,
                                  contentPadding: EdgeInsets.all(16),
                                ),
                                inputFormatters: [
                                  UpperCaseTextFormatter(),
                                ],
                                maxLines: 1,
                                maxLength: 50,
                                validationMessages: {
                                  ValidationMessage.required: (control) =>
                                      "Informe o Nome do Usuário.",
                                },
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text("Função:", style: STYLE_171717_F14),
                            ),
                            ToggleSwitch(
                              minWidth: 108.0,
                              minHeight: 32.0,
                              initialLabelIndex: initialLabelIndex,
                              cornerRadius: 4.0,
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.grey,
                              inactiveFgColor: Colors.grey[300],
                              totalSwitches: 2,
                              labels: const ["Administrador", "Usuário"],
                              activeBgColors: const [
                                [COLOR_00528C],
                                [COLOR_00528C]
                              ],
                              onToggle: (i) {
                                bool isAdmin = (i ?? 0) != 0;
                                ConfigUsuarioControl.defineIsAdministradorControl(!isAdmin);
                              }
                            ),
                            ReactiveFormConsumer(
                              builder: (context, form, child) {
                                return DefaultButton(
                                  width: CARD_WIDTH,
                                  height: 40,
                                  margin: const EdgeInsets.only(top: 8),
                                  color: COLOR_00528C,
                                  onPressed: _salvarUsuarioAsync,
                                  child: const Text("SALVAR",
                                      style: STYLE_FEFEFE_F14),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Error404Page(
                error: "ConfigModificarUsuarioPage: ${snapshot.error}");
          }
          return const LoadingPage(barHeight: false);
        },
      ),
    );
  }

  void _salvarUsuarioAsync() {
    if (AppControl.awaitResponse) {
      MensagemInfo(AWAIT_MESSAGE);
      return;
    }

    ConfigUsuarioControl.form.markAllAsTouched();

    if (ConfigUsuarioControl.usuario.isEmpty) {
      MensagemInfo("Informe o usuário!");
      return;
    }

    if (ConfigUsuarioControl.nome.isEmpty) {
      MensagemInfo("Informe o Nome do Usuário!");
      return;
    }

    if (ConfigUsuarioControl.senha.isEmpty) {
      MensagemInfo("Informe a senha do Usuário!");
      return;
    }

    if (ConfigUsuarioControl.form.invalid) {
      MensagemInfo("O formulário não está válido, tente novamente!");
      return;
    }

    AppControl.awaitingResponse();

    final Usuario usuario = ConfigUsuarioControl.getUsuario();

    app
        .get<UsuarioRepository>()
        .update(usuario.codUsuario, usuario)
        .then((usuario) {
          MensagemSucesso(
              "A modificação do usuário foi salva com sucesso!");

          AppControl.defineRoute(AppRoute.config_usuario);
        })
        .catchError((err) => SendError(ErrorType.USUARIO_SALVAR, err,
            " (Código: ${usuario.codUsuario})"))
        .whenComplete(() => AppControl.removeAwaitResponse());
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
