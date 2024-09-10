import 'package:canarinho_again_app/models/usuario/usuario.dart';
import 'package:json_annotation/json_annotation.dart';

part 'autenticacao.g.dart';

@JsonSerializable()
class Autenticacao {
    @JsonKey(name: 'token')
  final String accessToken;

  @JsonKey(name: 'usuario')
  final Usuario usuario;

  Autenticacao(
    this.accessToken,
    this.usuario,
  );

  factory Autenticacao.fromJson(Map<String, dynamic> json) {
    // Extraia o token e o objeto usuario
    final token = json['data']['token'] as String;
    final usuarioJson = json['data']['usuario'] as Map<String, dynamic>;

    // Crie o objeto Usuario a partir do JSON
    final usuario = Usuario.fromJson(usuarioJson);

    // Retorne o objeto Autenticacao
    return Autenticacao(token, usuario);
  }

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'data': {
      'token': accessToken,
      'usuario': usuario.toJson(),
    },
  };
}
