import 'package:canarinho_again_app/rounting/app_route_path.dart';
import 'package:canarinho_again_app/utils/app_const.dart';
import 'package:canarinho_again_app/utils/app_provider.dart';
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
        // if (controller.route == AppRoute.login)
        //   const MaterialPage(
        //     key: ValueKey("LoginPage"),
        //     child: LoginPage(),
        //   ),
        // if (controller.route == AppRoute.menu)
        //   const MaterialPage(
        //     key: ValueKey("MenuPage"),
        //     child: MenuPage(),
        //   ),
        // if (controller.route == AppRoute.error404)
        //   const MaterialPage(
        //     key: ValueKey("Error404Page"),
        //     child: Error404Page(barHeight: false),
        //   ),

        // // Configurações
        // if (controller.route == AppRoute.config)
        //   const MaterialPage(
        //     key: ValueKey("ConfigPage"),
        //     child: ConfigPage(),
        //   ),

        // // Configurações -> Área
        // if (controller.route == AppRoute.config_area_inspecao)
        //   const MaterialPage(
        //     key: ValueKey("ConfigAreaInspecaoPage"),
        //     child: ConfigAreaInspecaoPage(),
        //   ),
      ],
      onPopPage: (route, result) => route.didPop(result),
    );
  }
}
