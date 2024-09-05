import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/app_controls.dart';
import 'package:canarinho_again_app/app_environment.dart';
import 'package:canarinho_again_app/utils/pages/page_const.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Container PageMenuSheet({required BuildContext context}) {
  final Environment environment = AppControl.appEnvironment.environment;

  return Container(
    height: SHEET_HEIGHT,
    decoration: const BoxDecoration(
      border: Border(
        top: BorderSide(color: Color.fromARGB(255, 25, 52, 90), width: 1.0),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(left: 4),
        //   child: Text("Usuário: ${AcessoControl.username}", style: STYLE_171717_F12),
        // ),
        if (environment == Environment.development) getDevEnvironment(),
        if (environment == Environment.test) getTestEnvironment(),
        const Text("$APP_NAME v$APP_VERSION", style: STYLE_171717_F12),
        const Padding(
          padding: EdgeInsets.only(right: 4),
          child: Text(APP_COPYRIGHT, style: STYLE_171717_F12),
        ),
      ],
    ),
  );
}

Widget getDevEnvironment() {
  return const Text("DEV", style: TextStyle(fontSize: 12, fontFamily: DEFAULT_FONT, color: COLOR_RED));
}

Widget getTestEnvironment() {
  return const Text("TEST", style: TextStyle(fontSize: 12, fontFamily: DEFAULT_FONT, color: Colors.green));
}
