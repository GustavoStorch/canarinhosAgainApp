import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/utils/pages/page_const.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Visibility PageMenuButton({
  bool visible = true,
  required String title,
  required VoidCallback onTap,
  required Widget? trailing,
  bool lastButton = false,
}) {
  return Visibility(
    visible: visible,
    child: Center(
      child: SizedBox(
          width: CARD_WIDTH,
          child: Card(
            margin: EdgeInsets.fromLTRB(10, 12, 10, lastButton ? 12 : 0),
            elevation: PAGE_ELEVATION,
            color: COLOR_FEFEFE,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              trailing: trailing,
              title: Text(title, style: STYLE_171717_BF22),
              onTap: onTap,
            ),
          )),
    ),
  );
}
