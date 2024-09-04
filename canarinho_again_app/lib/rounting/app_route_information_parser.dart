import 'package:canarinho_again_app/rounting/app_route_path.dart';
import 'package:flutter/material.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    return AppRoutePath(AppRoute.error404);
  }
}
