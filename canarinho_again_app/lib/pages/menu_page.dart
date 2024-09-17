import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/app_controls.dart';
import 'package:canarinho_again_app/app_provider.dart';
import 'package:canarinho_again_app/controllers/default_controllers/acesso_controller.dart';
import 'package:canarinho_again_app/rounting/app_route_path.dart';
import 'package:canarinho_again_app/utils/pages/page_background.dart';
import 'package:canarinho_again_app/utils/pages/page_menubar.dart';
import 'package:canarinho_again_app/utils/pages/page_menubutton.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBackground(
      appBar: PageMenuBar(
        title: "Menu",
        icons: Icons.logout_rounded,
        onPressed: () {
          resetAllProviders();
        },
      ),
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView(
          children: [
            Consumer<AcessoController>(
              builder: (context, value, child) {
                return PageMenuButton(
                  visible: AcessoControl.isAdministrador,
                  title: "Configuração",
                  onTap: () => AppControl.defineRoute(AppRoute.config),
                  trailing: const Icon(Icons.settings_rounded,
                      color: COLOR_00528C, size: 20),
                );
              },
            ),
            PageMenuButton(
              title: "Consultas",
              onTap: () => AppControl.defineRoute(AppRoute.consultas),
              trailing: const Icon(Icons.search_rounded,
                  color: COLOR_00528C, size: 25),
            ),
            
            const Padding(padding: EdgeInsets.only(bottom: 36))
          ],
        ),
      ),
    );
  }
}
