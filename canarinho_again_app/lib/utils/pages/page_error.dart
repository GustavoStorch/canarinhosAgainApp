// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/app_provider.dart';
import 'package:canarinho_again_app/models/exception/bad_request_exception.dart';
import 'package:canarinho_again_app/models/exception/internal_error_exception.dart';
import 'package:canarinho_again_app/utils/pages/page_const.dart';
import 'package:flutter/material.dart';

bool mostrandoSnackbar = false;

String getMessageFromError(dynamic error) {
  if (error is FormatException ||
      error is BadRequestException ||
      error is SocketException ||
      error is TimeoutException) {
    error = error.message;
  }

  if (error is InternalErrorException) {
    error = error.error["errors"][0]["message"];
  }
  return error;
}

void MensagemSucesso(String message,
    [Color color = COLOR_GREEN, int duracao = 2]) {
  Mensagem(message, STYLE_FEFEFE_F16, color, duracao);
}

void MensagemAlerta(String message,
    [Color bgColor = COLOR_RED, int duracao = 10]) {
  Mensagem(message, STYLE_FEFEFE_F16, bgColor, duracao);
}

void MensagemInfo(String message,
    [Color bgColor = COLOR_YELLOW, int duracao = 3]) {
  Mensagem(message, STYLE_FEFEFE_F16, bgColor, duracao);
}

void Mensagem(String message,
    [TextStyle styleTxt = STYLE_FEFEFE_F16,
    Color bgColor = COLOR_00528C,
    int duracao = 2]) {
  if (mostrandoSnackbar) {
    Mensagem(message, styleTxt, bgColor, duracao);
    return;
  }

  appMessageKey.currentState!
      .showSnackBar(SnackBar(
        content: Text(message, style: styleTxt),
        backgroundColor: bgColor,
        elevation: PAGE_ELEVATION,
        duration: Duration(seconds: duracao),
        clipBehavior: Clip.hardEdge,
      ))
      .closed
      .then((e) {
    mostrandoSnackbar = false;
  });
}
