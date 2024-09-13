import 'package:json_annotation/json_annotation.dart';

part 'usuario.g.dart';

@JsonSerializable()
class Usuario {
  @JsonKey(name: 'codUsuario')
  int codUsuario;

  @JsonKey(name: 'usuario')
  String usuario;

  @JsonKey(name: 'nome')
  String nome;

  @JsonKey(name: 'senha')
  String senha;

  @JsonKey(name: 'isAdministrador')
  bool isAdministrador;

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
