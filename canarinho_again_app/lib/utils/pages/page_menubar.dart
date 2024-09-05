// ignore_for_file: non_constant_identifier_names

import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/utils/pages/page_button.dart';
import 'package:canarinho_again_app/utils/pages/page_const.dart';
import 'package:flutter/material.dart';

AppBar PageMenuBar({
  required String title,
  required VoidCallback onPressed,
  IconData icons = Icons.arrow_back_rounded,
  List<Widget>? actions,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: PAGE_ELEVATION,
    backgroundColor: COLOR_FEFEFE,
    leading: IconButton(
      tooltip: "VOLTAR",
      splashRadius: 24,
      icon: Icon(icons, color: COLOR_00528C, size: 20),
      onPressed: onPressed,
    ),
    centerTitle: true,
    toolbarHeight: TOOLBAR_HEIGHT,
    title: Text(title, style: STYLE_171717_F18),
    actions: actions,
  );
}

Widget PageAddButton(VoidCallback onPressed) {
  return Center(
    child: DefaultButton(
      margin: const EdgeInsets.only(right: 12),
      width: 96,
      color: COLOR_GREEN,
      onPressed: onPressed,
      child: const Text("ADICIONAR", style: STYLE_FEFEFE_F12),
    ),
  );
}

Widget PageSaveButton(VoidCallback onPressed) {
  return Center(
    child: DefaultButton(
      margin: const EdgeInsets.only(right: 12),
      width: 96,
      color: COLOR_GREEN,
      onPressed: onPressed,
      child: const Text("SALVAR", style: STYLE_FEFEFE_F12),
    ),
  );
}
