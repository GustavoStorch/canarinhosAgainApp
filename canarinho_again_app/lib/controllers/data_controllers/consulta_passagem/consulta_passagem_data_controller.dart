import 'package:canarinho_again_app/app_injections.dart';
import 'package:canarinho_again_app/models/consulta_passagem/consulta_passagem.dart';
import 'package:canarinho_again_app/repositories/consulta_passagem/consulta_passagem_respository.dart';
import 'package:canarinho_again_app/utils/controllers/default_data_controller.dart';

class ConsultaPassagemDataController extends DefaultDataController<ConsultaPassagem> {
  ConsultaPassagemDataController();

  @override
  Future<List<ConsultaPassagem>> loadDataAsync() async {
    defineData(await app.get<ConsultaPassagemRepository>().getAll());
    return data;
  }
}
