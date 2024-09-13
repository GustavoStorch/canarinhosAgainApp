import 'dart:async';
import 'dart:io';

import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/app_provider.dart';
import 'package:canarinho_again_app/models/exception/bad_request_exception.dart';
import 'package:canarinho_again_app/models/exception/internal_error_exception.dart';
import 'package:canarinho_again_app/utils/pages/page_background.dart';
import 'package:canarinho_again_app/utils/pages/page_button.dart';
import 'package:canarinho_again_app/utils/pages/page_const.dart';
import 'package:flutter/material.dart';

class Error404Page extends StatelessWidget {
  final Object? error;
  final bool barHeight;
  final AppBar? appBar;
  final Widget? bottomSheet;

  const Error404Page({
    Key? key,
    this.error,
    this.barHeight = true,
    this.appBar,
    this.bottomSheet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBackground(
      barHeight: barHeight,
      appBar: appBar,
      bottomSheet: bottomSheet,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/canarinhoagain/images/logo_canarinho.png"),
          Transform.translate(
            offset: const Offset(0, 52),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Ops!", style: STYLE_FEFEFE_F16),
                getExceptionWidget(),
                DefaultButton(
                  margin: const EdgeInsets.only(top: 4),
                  width: 64,
                  color: COLOR_FEFEFE,
                  onPressed: () {
                    resetAllProviders();
                  },
                  child: const Icon(Icons.home_rounded, color: COLOR_00528C, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getExceptionWidget() {
    if (error is InternalErrorException) {
      final request = error as InternalErrorException;
      dynamic message = request.error["errors"];
      if (message != null) {
        return _InternalErrorException(error: message[0]["message"]);
      }

      return _InternalErrorException(error: request.error["error_description"]);
    }

    if (error is BadRequestException) {
      final request = error as BadRequestException;
      dynamic message = request.error["errors"];
      if (message != null) {
        return _BadRequestException(error: message[0]["message"]);
      }

      return _BadRequestException(error: request.error["error_description"]);
    }

    if (error is SocketException) {
      return _SocketException(error: (error as SocketException).message);
    }

    if (error is TimeoutException) {
      return _TimeoutException(error: (error as TimeoutException).message);
    }

    return _UnknownException(error: error.toString());
  }
}

class _InternalErrorException extends StatelessWidget {
  final String error;

  const _InternalErrorException({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text(
            "Ocorreu um erro interno no servidor, contate um administrador e informe-o.",
            style: STYLE_FEFEFE_F14,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(8),
          decoration: BOX_DECORATION,
          child: Text(error, style: STYLE_171717_F12),
        ),
      ],
    );
  }
}

class _BadRequestException extends StatelessWidget {
  final String error;

  const _BadRequestException({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(error, style: STYLE_FEFEFE_F14, textAlign: TextAlign.center),
    );
  }
}

class _SocketException extends StatelessWidget {
  final String error;

  const _SocketException({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text("Não foi possível estabelecer uma conexão com o servidor.", style: STYLE_FEFEFE_F14),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text("Verifique sua conexão com a internet.", style: STYLE_FEFEFE_F14),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(8),
          decoration: BOX_DECORATION,
          child: Text(error, style: STYLE_171717_F12),
        ),
      ],
    );
  }
}

class _TimeoutException extends StatelessWidget {
  final String? error;

  const _TimeoutException({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text("A conexão com o servidor excedeu o tempo limite.", style: STYLE_FEFEFE_F14),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(8),
          decoration: BOX_DECORATION,
          child: Text(error.toString(), style: STYLE_171717_F12),
        ),
      ],
    );
  }
}

class _UnknownException extends StatelessWidget {
  final String error;

  const _UnknownException({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(8),
      decoration: BOX_DECORATION,
      child: Text(error, style: STYLE_171717_F12),
    );
  }
}
