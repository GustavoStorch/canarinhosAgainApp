// ignore_for_file: constant_identifier_names

class AppRoutePath {
  final AppRoute route;

  AppRoutePath(this.route);

  bool get isSubMenu =>
      route == AppRoute.config; 
      // ||
      // route == AppRoute.inspecao_limpeza ||
      // route == AppRoute.liberacao_maquina ||
      // route == AppRoute.setup_molde ||
      // route == AppRoute.registro_sala_limpa;
}

enum AppRoute {
  login,
  menu,
  error404,
  // Configurações
  config,
  
  // Configurações -> Usuários
  config_usuario,
  config_usuario_adicionar,
  config_usuario_modificar,

  // Consultas -> Passagens
  consultas,
  consulta_passagem,
}
