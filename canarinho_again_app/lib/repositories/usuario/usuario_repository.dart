import 'dart:convert';

import 'package:canarinho_again_app/models/http/http_client.dart';
import 'package:canarinho_again_app/models/usuario/usuario.dart';

class UsuarioRepository {
  // ignore: non_constant_identifier_names
  String get URL => "api/usuario";

  Future<Usuario> create(Usuario usuario) async {
    final String modelJson = jsonEncode(usuario.toJson());
    final response = await HttpClient.post(
      route: URL,
      jsonBody: modelJson,
      authenticate: true,
    );

    final dynamic decodedJson = jsonDecode(response.body);
    if (decodedJson == null) {
      throw "Não foi possível criar o Usuário.";
    }

    final Usuario data = Usuario.fromJson(decodedJson['data']);
    return data;
  }

  Future<Usuario> update(int codUsuario, Usuario area) async {
    if (codUsuario <= 0) {
      throw ArgumentError.value("codUsuario");
    }

    final String modelJson = jsonEncode(area.toJson());
    final Map<String, String> parameters = {
      "codUsuario": codUsuario.toString(),
    };

    final response = await HttpClient.putJson(
      parameters: parameters,
      route: URL,
      jsonBody: modelJson,
      authenticate: true,
    );

    final dynamic decodedJson = jsonDecode(response.body);
    if (decodedJson == null) {
      throw "Não foi possível atualizar a área.";
    }

    final Usuario data = Usuario.fromJson(decodedJson);
    return data;
  }

  Future<List<Usuario>> getAll() async {
    final response = await HttpClient.get(
      route: URL,
      authenticate: true,
    );

    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Usuario> data = decodedJson.map((dynamic json) => Usuario.fromJson(json)).toList();
    return data;
  }

  Future<Usuario> get(int codUsuario) async {
    if (codUsuario <= 0) {
      throw ArgumentError.value("codUsuario");
    }

    final Map<String, String> parameters = {
      "codUsuario": codUsuario.toString(),
    };

    final response = await HttpClient.get(
      parameters: parameters,
      route: "$URL/by",
      authenticate: true,
    );

    final dynamic decodedJson = jsonDecode(response.body);
    if (decodedJson == null) {
      throw "Não foi possível encontrar o Usuário selecionada.";
    }

    final Usuario data = Usuario.fromJson(decodedJson);
    return data;
  }

  Future<void> delete(Usuario usuario) async {
    if (usuario.codUsuario <= 0) {
      throw ArgumentError.value(usuario.codUsuario, "codUsuario", "O código do usuário deve ser maior que 0.");
    }

    final String modelJson = jsonEncode(usuario.toJson());

    final response = await HttpClient.delete(
      jsonBody: modelJson,
      route: "$URL/${usuario.usuario}",
      authenticate: true,
    );

    if (response.statusCode != 200) {
      throw "Não foi possível excluir o Usuário.";
    }
  }
}
