import 'package:canarinho_again_app/repositories/autenticacao/autenticacao_repository.dart';
import 'package:canarinho_again_app/repositories/usuario/usuario_repository.dart';
import 'package:get_it/get_it.dart';

GetIt app = GetIt.instance;

void injectDependency() {
  app.registerLazySingleton(() => AutenticacaoRepository());
  app.registerLazySingleton(() => UsuarioRepository());
}