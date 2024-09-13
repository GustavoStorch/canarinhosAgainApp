// ignore_for_file: non_constant_identifier_names

import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/app_controls.dart';
import 'package:canarinho_again_app/app_injections.dart';
import 'package:canarinho_again_app/controllers/data_controllers/pesquisa_data_controller.dart';
import 'package:canarinho_again_app/controllers/data_controllers/usuario/usuario_data_controller.dart';
import 'package:canarinho_again_app/models/usuario/usuario.dart';
import 'package:canarinho_again_app/pages/error404_page.dart';
import 'package:canarinho_again_app/pages/loading_page.dart';
import 'package:canarinho_again_app/repositories/usuario/usuario_repository.dart';
import 'package:canarinho_again_app/rounting/app_route_path.dart';
import 'package:canarinho_again_app/utils/app/app_error.dart';
import 'package:canarinho_again_app/utils/pages/page_background.dart';
import 'package:canarinho_again_app/utils/pages/page_button.dart';
import 'package:canarinho_again_app/utils/pages/page_const.dart';
import 'package:canarinho_again_app/utils/pages/page_dialog.dart';
import 'package:canarinho_again_app/utils/pages/page_error.dart';
import 'package:canarinho_again_app/utils/pages/page_menubar.dart';
import 'package:canarinho_again_app/utils/pages/page_search.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ConfigUsuarioPage extends StatelessWidget {
  const ConfigUsuarioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBackground(
      appBar: PageMenuBar(
        title: "Usuários",
        onPressed: () => AppControl.defineRoute(AppRoute.config),
        actions: [
          PageAddButton(() {
            AppControl.defineRoute(AppRoute.config_usuario_adicionar);
            ConfigUsuarioControl.reset();
          })
        ],
      ),
      child: FutureBuilder(
        future: Future.wait({
          UsuarioDataControl.loadDataAsync()
        }),
        builder: (context, snapshot) {
          if (snapshot.inState(ConnectionState.done).hasData) {
            if (UsuarioDataControl.data.isEmpty) {
              return const Center(
                  child: Text("Não foi possível encontrar um Usuário.", style: STYLE_FEFEFE_F16));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const PageSearch(),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 165,
                  child: Consumer<PesquisaDataController>(
                    builder: (context, value, child) {
                      final List<Usuario> usuarioList = [
                        ...UsuarioDataControl.data.where((e) =>
                            PesquisaDataControl.filtro.isEmpty ||
                            (e.usuario.contains(RegExp(PesquisaDataControl.filtro, caseSensitive: false))) ||
                            (e.nome.contains(RegExp(PesquisaDataControl.filtro, caseSensitive: false))))
                      ];

                      return Scrollbar(
                        thumbVisibility: true,
                        child: ListView.builder(
                          itemCount: usuarioList.length,
                          itemBuilder: (context, i) {
                            return Consumer<UsuarioDataController>(
                              builder: (context, value, child) {
                                final Usuario usuarioModel = usuarioList[i];

                                final int codigo = usuarioModel.codUsuario;
                                final String usuario = usuarioModel.usuario;
                                final String nome = usuarioModel.nome;
                                final bool isAdministrador = usuarioModel.isAdministrador;

                                const bool visible = true;
                                return Visibility(
                                  visible: true,
                                  child: Center(
                                      child: SizedBox(
                                    width: CARD_WIDTH,
                                    child: Card(
                                      elevation: PAGE_ELEVATION,
                                      margin: EdgeInsets.fromLTRB(
                                          12, (i == 0 ? 0 : 12), 12, (i == usuarioList.length - 1 ? 38 : 0)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8),
                                        child: ListTile(
                                          title: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text("Usuário: $usuario",
                                                  style: ConfigUsuarioControl.codUsuario == codigo
                                                      ? STYLE_GREEN_BF14
                                                      : STYLE_171717_BF14),
                                              Text("Nome: $nome", style: STYLE_171717_F14),
                                              Text("Função: ${isAdministrador ? "Administrador" : "Usuário"}", style: STYLE_171717_F14),
                                            ],
                                          ),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.only(top: 8),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                if (visible)
                                                  DefaultButton(
                                                    width: 112,
                                                    margin: const EdgeInsets.only(right: 4),
                                                    color: COLOR_00528C,
                                                    onPressed: () {
                                                      ConfigUsuarioControl.defineByUsuario(usuarioModel);
                                                      AppControl.defineRoute(AppRoute.config_usuario_modificar);
                                                    },
                                                    child: const Text("MODIFICAR", style: STYLE_FEFEFE_F12),
                                                  ),
                                                if (visible)
                                                  DefaultButton(
                                                    width: 112,
                                                    color: COLOR_RED,
                                                    onPressed: () async {
                                                      ConfigUsuarioControl.defineByUsuario(usuarioModel);
                                                      await _deletarAreaDialog(context);
                                                    },
                                                    child: const Text("DELETAR", style: STYLE_FEFEFE_F12),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Error404Page(error: "ConfigAreaInspecaoPage: ${snapshot.error}");
          }
          return const LoadingPage();
        },
      ),
    );
  }

  Future<Widget?> _deletarAreaDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return DefaultDialog(
          title: "Deletar Usuário",
          content: "Deseja deletar este Usuário?",
          button: "DELETAR",
          width: 96,
          color: COLOR_RED,
          onPressed: () => _atualizarUsuarioAsync("DELETADO"),
        );
      },
    );
  }

  void _atualizarUsuarioAsync([String situacao = ""]) {
    if (AppControl.awaitResponse) {
      MensagemInfo(AWAIT_MESSAGE);
      return;
    }

    AppControl.awaitingResponse();

    final Usuario usuarioModel = ConfigUsuarioControl.getUsuario();

    app
        .get<UsuarioRepository>()
        .delete(usuarioModel)
        .then((usuario) {
          _atualizarUsuarioMenu(usuarioModel);
          MensagemSucesso("A Usuário foi deletado com sucesso!");
        })
        .catchError((err) => SendError(ErrorType.USUARIO_SALVAR, err, " (Código: ${usuarioModel.codUsuario})"))
        .whenComplete(() => AppControl.removeAwaitResponse());
  }

  void _atualizarUsuarioMenu(Usuario usuarioModel) {
    UsuarioDataControl.data.removeWhere((e) => e.codUsuario == usuarioModel.codUsuario);
    UsuarioDataControl.notify();
  }
}
