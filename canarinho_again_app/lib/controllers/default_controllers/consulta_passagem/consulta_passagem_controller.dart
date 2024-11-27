import 'package:canarinho_again_app/models/consulta_passagem/consulta_passagem.dart';
import 'package:canarinho_again_app/utils/controllers/default_controller.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ConsultaPassagemController extends DefaultController {
  ConsultaPassagemController();

  final FormGroup _form = fb.group({
    "codApontamento": [0],
    "quantidade": [0],
    "dataHora": [""],
    "linhaOnibus": [""],
    "ehEntrada": [false]
  });

  /// Retorna o formulário.
  FormGroup get form => _form;

  /// Retorna o controle do codApontamento.
  AbstractControl get codApontamentoControl => _form.control("codApontamento");

  /// Retorna o codApontamento.
  int get codApontamento => codApontamentoControl.value ?? 0;

  /// Define o valor do codApontamento.
  void defineCodApontamento(int value, [bool sendNotify = true]) {
    codApontamentoControl.value = value;
    if (sendNotify) notify();
  }

  /// Retorna o controle de quantidade.
  AbstractControl get quantidadeControl => _form.control("quantidade");

  /// Retorna o quantidade.
  double get quantidade => quantidadeControl.value ?? "";

  /// Define o valor do quantidade.
  void defineQuantidade(double value, [bool sendNotify = true]) {
    quantidadeControl.value = value;
    if (sendNotify) notify();
  }

  /// Retorna o controle da dataHora.
  AbstractControl get dataHoraControl => _form.control("dataHora");

  /// Retorna a dataHora.
  DateTime get dataHora => dataHoraControl.value ?? "";

  void defineDataHora(DateTime value, [bool sendNotify = true]) {
    dataHoraControl.value = value;
    if (sendNotify) notify();
  }

  /// Retorna o controle da linha do onibus.
  AbstractControl get linhaOnibusControl => _form.control("linhaOnibus");

  /// Retorna a linha do onibus.
  String get linhaOnibus => linhaOnibusControl.value ?? "";
  
  void defineLinhaOnibus(String value, [bool sendNotify = true]) {
    linhaOnibusControl.value = value;
    if (sendNotify) notify();
  }

  /// Retorna o controle da se é entrada.
  AbstractControl get ehEntradaontrol => _form.control("ehEntrada");

  /// Retorna a linha do onibus.
  bool get ehEntrada => ehEntradaontrol.value ?? false;
  
  void defineEntrada(bool value, [bool sendNotify = true]) {
    ehEntradaontrol.value = value;
    if (sendNotify) notify();
  }

  /// Define o formulário a partir de um apontamento.
  void defineByApontamento(ConsultaPassagem value) {
    defineCodApontamento(value.codApontamento);
    defineQuantidade(value.quantidade);
    defineDataHora(value.dataHora);
    defineLinhaOnibus(value.linhaOnibus);
    defineEntrada(value.ehEntrada);
  }

  /// Retorna um apontamento a partir do formulário.
  ConsultaPassagem getApontamento() {
    return ConsultaPassagem(codApontamento, quantidade, dataHora, linhaOnibus, ehEntrada);
  }

  @override
  void reset() {
    codApontamentoControl.reset(value: 0);
    quantidadeControl.reset(value: 0);
    dataHoraControl.reset(value: "");
    linhaOnibusControl.reset(value: "");
    ehEntradaontrol.reset(value: false);
  }
}
