// ignore_for_file: non_constant_identifier_names

import 'package:canarinho_again_app/app_controls.dart';
import 'package:canarinho_again_app/controllers/app_controller.dart';
import 'package:canarinho_again_app/controllers/default_controllers/acesso_controller.dart';
import 'package:canarinho_again_app/controllers/page_controllers/login_page_controller.dart';
import 'package:canarinho_again_app/rounting/app_route_information_parser.dart';
import 'package:canarinho_again_app/rounting/app_router_delegate.dart';
import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/utils/pages/page_error.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> appKey = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldMessengerState> appMessageKey =
    GlobalKey<ScaffoldMessengerState>();

class AppProvider extends StatelessWidget {
  AppProvider({Key? key}) : super(key: key);

  // App Controller
  final appController = AppController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // App Controller
        ChangeNotifierProvider(create: (_) => appController),

        // Default Controllers
        // ChangeNotifierProvider(create: (_) => PesquisaDataController()),

        ChangeNotifierProvider(create: (_) => AcessoController()),

        // ChangeNotifierProvider(
        //     create: (_) => InspecaoLimpezaConsultarController()),

        // // Page Controllers
        ChangeNotifierProvider(create: (_) => LoginPageController()),
      ],
      child: MaterialApp.router(
        key: appKey,
        scaffoldMessengerKey: appMessageKey,
        title: APP_NAME,
        debugShowCheckedModeBanner: false,
        routerDelegate: AppRouterDelegate(appController),
        routeInformationParser: AppRouteInformationParser(),
        supportedLocales: const [
          Locale("pt", "BR"), // Portuguese, no country code
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // Previne alterar a escala do texto com base na config. do tablet.
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child ?? Container(),
          );
        },
      ),
    );
  }
}

void resetAllProviders() {
  resetDataProviders();

  AppControl.reset();
  AcessoControl.reset();

  mostrandoSnackbar = false;
}

void resetDataProviders() {
// Default Controllers
 AppControl.removeAwaitResponse();

  LoginPageControl.reset();
}
