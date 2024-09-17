import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/app_controls.dart';
import 'package:canarinho_again_app/rounting/app_route_path.dart';
import 'package:canarinho_again_app/utils/pages/page_background.dart';
import 'package:canarinho_again_app/utils/pages/page_menubar.dart';
import 'package:canarinho_again_app/utils/pages/page_menubutton.dart';
import 'package:flutter/material.dart';

class ConsultasPage extends StatelessWidget {
  const ConsultasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBackground(
      appBar: PageMenuBar(
        title: "Consultas",
        onPressed: () => AppControl.defineRoute(AppRoute.menu),
      ),
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView(
          children: [
            PageMenuButton(
              title: "Consulta Passagens",
              onTap: () => AppControl.defineRoute(AppRoute.consulta_passagem),
              trailing: const Icon(Icons.bus_alert_rounded, color: COLOR_00528C, size: 25),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 36))
          ],
        ),
      ),
    );
  }
}
