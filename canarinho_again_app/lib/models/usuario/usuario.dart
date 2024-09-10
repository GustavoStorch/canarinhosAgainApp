import 'package:json_annotation/json_annotation.dart';

part 'usuario.g.dart';

@JsonSerializable()
class Usuario {
  @JsonKey(name: 'codUsuario')
  final int codUsuario;

  @JsonKey(name: 'usuario')
  final String usuario;

  @JsonKey(name: 'nome')
  final String nome;

  @JsonKey(name: 'senha')
  final String senha;

  @JsonKey(name: 'isAdministrador')
  final bool isAdministrador;

  Usuario(
    this.codUsuario,
    this.usuario,
    this.nome,
    this.senha,
    this.isAdministrador,
  );

  factory Usuario.fromJson(Map<String, dynamic> json) => _$UsuarioFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}
