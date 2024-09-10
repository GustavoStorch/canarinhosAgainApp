import 'dart:convert';

import 'package:canarinho_again_app/models/autenticacao/autenticacao.dart';
import 'package:canarinho_again_app/models/http/http_client.dart';

class AutenticacaoRepository {
  // ignore: non_constant_identifier_names
  String get URL => "authentication";

  Future<Autenticacao> check(String usuario, String senha) async {
    if (usuario.isEmpty) {
      throw ArgumentError.notNull("usuario");
    }

    if (senha.isEmpty) {
      throw ArgumentError.notNull("senha");
    }

    final Map<String, dynamic> modelJson = {
    "usuario": usuario,
    "senha": senha,
  };

    final response = await HttpClient.postJson(
      route: URL,
      jsonBody: modelJson,
      authenticate: false,
    );

    final dynamic decodedJson = jsonDecode(response.body);
    if (decodedJson == null) {
      throw "Não foi possível concluir a autenticação.";
    }

    return Autenticacao.fromJson(decodedJson);
  }
}
