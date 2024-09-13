// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'autenticacao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Autenticacao _$AutenticacaoFromJson(Map<String, dynamic> json) => Autenticacao(
      json['token'] as String,
      Usuario.fromJson(json['usuario'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AutenticacaoToJson(Autenticacao instance) =>
    <String, dynamic>{
      'token': instance.accessToken,
      'usuario': instance.usuario,
    };
