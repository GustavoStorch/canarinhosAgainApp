import 'package:canarinho_again_app/controllers/app_controller.dart';
import 'package:canarinho_again_app/pages/configuracoes/configuracoes_page.dart';
import 'package:canarinho_again_app/pages/configuracoes/usuario/adicionar_usuario_page.dart';
import 'package:canarinho_again_app/pages/configuracoes/usuario/modificar_usuario_page.dart';
import 'package:canarinho_again_app/pages/configuracoes/usuario/usuario_page.dart';
import 'package:canarinho_again_app/pages/error404_page.dart';
import 'package:canarinho_again_app/pages/login_page.dart';
import 'package:canarinho_again_app/pages/menu_page.dart';
import 'package:canarinho_again_app/rounting/app_route_path.dart';
import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/app_provider.dart';
import 'package:flutter/material.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  final AppController controller;

  AppRouterDelegate(this.controller) {
    controller.addListener(() {
      notifyListeners();
    });
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  AppRoutePath get currentConfiguration {
    return AppRoutePath(controller.route);
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    if (navigatorKey.currentContext == null) {
      return;
    }

    if (AppRoute.values.contains(configuration.route)) {
      controller.defineRoute(configuration.route);
    } else {
      controller.defineRoute(APP_DEFAULT_ROUTE);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentConfiguration.isSubMenu) {
      resetDataProviders();
    }

    return Navigator(
      key: navigatorKey,
      pages: [
        if (controller.route == AppRoute.login)
          const MaterialPage(
            key: ValueKey("LoginPage"),
            child: LoginPage(),
          ),
        if (controller.route == AppRoute.menu)
          const MaterialPage(
            key: ValueKey("MenuPage"),
            child: MenuPage(),
          ),
        if (controller.route == AppRoute.error404)
          const MaterialPage(
            key: ValueKey("Error404Page"),
            child: Error404Page(barHeight: false),
          ),

        // Configurações
        if (controller.route == AppRoute.config)
          const MaterialPage(
            key: ValueKey("ConfigPage"),
            child: ConfigPage(),
          ),

        // Configurações -> Usuário
        if (controller.route == AppRoute.config_usuario)
          const MaterialPage(
            key: ValueKey("ConfigUsuarioPage"),
            child: ConfigUsuarioPage(),
          ),
           if (controller.route == AppRoute.config_usuario_adicionar)
          const MaterialPage(
            key: ValueKey("ConfigAdicionarUsuarioPage"),
            child: ConfigAdicionarUsuarioPage(),
          ),
          if (controller.route == AppRoute.config_usuario_modificar)
          const MaterialPage(
            key: ValueKey("ConfigModificarUsuarioPage"),
            child: ConfigModificarUsuarioPage(),
          ),
      ],
      onPopPage: (route, result) => route.didPop(result),
    );
  }
}
