import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/app_controls.dart';
import 'package:canarinho_again_app/controllers/default_controllers/acesso_controller.dart';
import 'package:canarinho_again_app/rounting/app_route_path.dart';
import 'package:canarinho_again_app/utils/pages/page_background.dart';
import 'package:canarinho_again_app/utils/pages/page_menubar.dart';
import 'package:canarinho_again_app/utils/pages/page_menubutton.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBackground(
      appBar: PageMenuBar(
        title: "Configurações",
        onPressed: () => AppControl.defineRoute(AppRoute.menu),
      ),
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView(
          children: [
            PageMenuButton(
              title: "Usuários",
              onTap: () => AppControl.defineRoute(AppRoute.config_usuario),
              trailing: const Icon(Icons.person_2_rounded, color: COLOR_00528C, size: 25),
            ),
            // PageMenuButton(
            //   title: "Produto para Limpeza",
            //   onTap: () => AppControl.defineRoute(AppRoute.config_produto_inspecao),
            //   trailing: const Icon(Icons.check_box_outline_blank_rounded, color: COLOR_00528C, size: 25),
            // ),
            Consumer<AcessoController>(
              builder: (context, value, child) {
                return PageMenuButton(
                  visible: AcessoControl.isAdministrador,
                  title: "Ambiente do Aplicativo. (${AppControl.appEnvironment.environmentName})",
                  onTap: () => AppControl.toggleAppEnvironment(),
                  trailing: const Icon(Icons.terminal_rounded, color: COLOR_00528C, size: 25),
                );
              },
            ),
            const Padding(padding: EdgeInsets.only(bottom: 36))
          ],
        ),
      ),
    );
  }
}
