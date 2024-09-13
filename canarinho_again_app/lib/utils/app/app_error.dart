// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:canarinho_again_app/app_controls.dart';
import 'package:canarinho_again_app/utils/pages/page_error.dart';

enum ErrorType {
   // Setup de Molde
  // SETUP_MOLDE_NOVO,
  // SETUP_MOLDE_INSPECAO_NOVA,
  // SETUP_MOLDE_INSPECAO_STATUS_ATUALIZAR,
  // SETUP_MOLDE_OF_NAO_APLICA,
  LOGIN_ERROR,
  USUARIO_SALVAR
}

String getMessageByError(ErrorType type) {
  switch (type) {
    case ErrorType.LOGIN_ERROR:
      return "Ocorreu um erro ao tentar efetuar o login.";
    case ErrorType.USUARIO_SALVAR:
      return "Ocorreu um erro ao tentar salvar o usuário";
    default:
      return "";
  }
}

SendError(ErrorType type, dynamic err,
    [String informacao = "", bool saveLog = true]) {
  final String message = getMessageByError(type);
  final String errorMessage = getMessageFromError(err);
  MensagemAlerta("$message$informacao Erro: $errorMessage");

  AppControl.removeAwaitResponse();
}
