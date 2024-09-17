import 'package:json_annotation/json_annotation.dart';

part 'consulta_passagem.g.dart';

@JsonSerializable()
class ConsultaPassagem {
  @JsonKey(name: 'codApontamento')
  int codApontamento;

  @JsonKey(name: 'quantidade')
  double quantidade;

  @JsonKey(name: 'dataHora')
  DateTime dataHora;

  @JsonKey(name: 'linhaOnibus')
  String linhaOnibus;

  ConsultaPassagem(
    this.codApontamento,
    this.quantidade,
    this.dataHora,
    this.linhaOnibus,
  );

   factory ConsultaPassagem.fromJson(Map<String, dynamic> json) => _$ConsultaPassagemFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultaPassagemToJson(this);
}
