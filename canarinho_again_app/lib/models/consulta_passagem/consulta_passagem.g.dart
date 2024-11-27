// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_passagem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultaPassagem _$ConsultaPassagemFromJson(Map<String, dynamic> json) =>
    ConsultaPassagem(
      (json['codApontamento'] as num).toInt(),
      (json['quantidade'] as num).toDouble(),
      DateTime.parse(json['dataHora'] as String),
      json['linhaOnibus'] as String,
      json['ehEntrada'] as bool,
    );

Map<String, dynamic> _$ConsultaPassagemToJson(ConsultaPassagem instance) =>
    <String, dynamic>{
      'codApontamento': instance.codApontamento,
      'quantidade': instance.quantidade,
      'dataHora': instance.dataHora.toIso8601String(),
      'linhaOnibus': instance.linhaOnibus,
      'ehEntrada': instance.ehEntrada,
    };
