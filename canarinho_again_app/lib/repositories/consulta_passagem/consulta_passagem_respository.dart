import 'dart:convert';

import 'package:canarinho_again_app/models/consulta_passagem/consulta_passagem.dart';
import 'package:canarinho_again_app/models/http/http_client.dart';
import 'package:canarinho_again_app/models/usuario/usuario.dart';

class ConsultaPassagemRepository {
  // ignore: non_constant_identifier_names
  String get URL => "api/passagem-apontamento";

  Future<List<ConsultaPassagem>> getAll() async {
    final response = await HttpClient.get(
      route: URL,
      authenticate: true,
    );

    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<ConsultaPassagem> data = decodedJson.map((dynamic json) => ConsultaPassagem.fromJson(json)).toList();
    return data;
  }

  Future<Usuario> get(int codApontamento) async {
    if (codApontamento <= 0) {
      throw ArgumentError.value("codApontamento");
    }

    final Map<String, String> parameters = {
      "codApontamento": codApontamento.toString(),
    };

    final response = await HttpClient.get(
      parameters: parameters,
      route: "$URL/by",
      authenticate: true,
    );

    final dynamic decodedJson = jsonDecode(response.body);
    if (decodedJson == null) {
      throw "Não foi possível encontrar o apontamento selecionado.";
    }

    final Usuario data = Usuario.fromJson(decodedJson);
    return data;
  }
}
