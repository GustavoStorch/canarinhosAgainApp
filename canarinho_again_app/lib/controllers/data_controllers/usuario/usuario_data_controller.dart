import 'package:canarinho_again_app/app_injections.dart';
import 'package:canarinho_again_app/models/usuario/usuario.dart';
import 'package:canarinho_again_app/repositories/usuario/usuario_repository.dart';
import 'package:canarinho_again_app/utils/controllers/default_data_controller.dart';

class UsuarioDataController extends DefaultDataController<Usuario> {
  UsuarioDataController();

  @override
  Future<List<Usuario>> loadDataAsync() async {
    defineData(await app.get<UsuarioRepository>().getAll());
    return data;
  }
}
