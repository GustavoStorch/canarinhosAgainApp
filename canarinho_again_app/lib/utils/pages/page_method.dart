import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/utils/pages/page_const.dart';
import 'package:flutter/material.dart';

String getNomeByGrupo(String grupo) {
  switch (grupo) {
    case "supervisor":
      return "Supervisor";
    case "qualidade":
      return "Qualidade";
    case "manutencao":
      return "Manutenção";
  }
  return "?";
}

Color getColorByStatus(String status) {
  if (status == "EM ANDAMENTO") {
    return COLOR_FEFEFE;
  }

  if (status == "BLOQUEADO" || status == "REPROVADO") {
    return CARD_COLOR_RED;
  }

  if (status == "LIBERADO CONDICIONALMENTE") {
    return CARD_COLOR_YELLOW;
  }

  if (status == "CONFORME") {
    return CARD_COLOR_GREEN;
  }

  if (status == "NÃO CONFORME") {
    return CARD_COLOR_RED;
  }

  return CARD_COLOR_GREEN;
}

Widget getNenhumDadoWidget(BuildContext context, String value) {
  return Container(
    height: 70,
    alignment: Alignment.center,
    child: const Text("Não foi possível encontrar nenhum dado."),
  );
}
