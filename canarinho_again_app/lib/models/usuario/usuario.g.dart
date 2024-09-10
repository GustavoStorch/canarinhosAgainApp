// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) => Usuario(
      (json['codUsuario'] as num).toInt(),
      json['usuario'] as String,
      json['nome'] as String,
      json['senha'] as String,
      json['isAdministrador'] as bool,
    );

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      'codUsuario': instance.codUsuario,
      'usuario': instance.usuario,
      'nome': instance.nome,
      'senha': instance.senha,
      'isAdministrador': instance.isAdministrador,
    };
