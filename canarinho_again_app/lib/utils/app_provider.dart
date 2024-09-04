// ignore_for_file: non_constant_identifier_names

import 'package:canarinho_again_app/rounting/app_route_information_parser.dart';
import 'package:canarinho_again_app/rounting/app_router_delegate.dart';
import 'package:canarinho_again_app/utils/app_const.dart';
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
        ChangeNotifierProvider(create: (_) => PesquisaDataController()),

        ChangeNotifierProvider(create: (_) => AcessoController()),

        ChangeNotifierProvider(
            create: (_) => InspecaoLimpezaConsultarController()),
        ChangeNotifierProvider(create: (_) => InspecaoLimpezaController()),

        ChangeNotifierProvider(
            create: (_) => InspecaoSalaLimpaConsultarController()),
        ChangeNotifierProvider(create: (_) => InspecaoSalaLimpaController()),

        ChangeNotifierProvider(create: (_) => ConfigAreaController()),
        ChangeNotifierProvider(create: (_) => ConfigChecklistController()),
        ChangeNotifierProvider(create: (_) => ConfigProdutoController()),

        ChangeNotifierProvider(
            create: (_) => LiberacaoMaquinaConsultarController()),
        ChangeNotifierProvider(create: (_) => LiberacaoMaquinaController()),

        ChangeNotifierProvider(create: (_) => SetupMoldeConsultarController()),
        ChangeNotifierProvider(create: (_) => SetupMoldeController()),

        ChangeNotifierProvider(
            create: (_) => LiberarMoldeBloqueadoController()),

        ChangeNotifierProvider(create: (_) => ItemAvaliadoController()),
        ChangeNotifierProvider(
            create: (_) => SalaLimpaMaquinaMonitoradoController()),
        ChangeNotifierProvider(create: (_) => SalaLimpaInspecaoController()),

        ChangeNotifierProvider(create: (_) => ConsultaInspecionarController()),

        // Data Controllers
        ChangeNotifierProvider(create: (_) => AreaDataController()),
        ChangeNotifierProvider(create: (_) => AreaProdutoDataController()),
        ChangeNotifierProvider(create: (_) => AreaChecklistDataController()),

        ChangeNotifierProvider(create: (_) => AcessoUsuarioDataController()),
        ChangeNotifierProvider(create: (_) => AcessoSupervisorDataController()),
        ChangeNotifierProvider(create: (_) => AcessoManutencaoDataController()),

        ChangeNotifierProvider(create: (_) => ProdutoDataController()),
        ChangeNotifierProvider(create: (_) => ChecklistDataController()),

        ChangeNotifierProvider(create: (_) => ItemAvaliadoDataController()),
        ChangeNotifierProvider(
            create: (_) => SalaLimpaMaquinaMonitoradoDataController()),
        ChangeNotifierProvider(
            create: (_) => SalaLimpaInspecaoDataController()),

        ChangeNotifierProvider(
            create: (_) => InspecaoSalaLimpaMaquinaDataController()),

        ChangeNotifierProvider(
            create: (_) => LiberacaoMaquinaChecklistDataController()),
        ChangeNotifierProvider(create: (_) => LiberacaoMaquinaDataController()),
        ChangeNotifierProvider(
            create: (_) => LiberacaoMaquinaInspecaoDataController()),

        ChangeNotifierProvider(
            create: (_) => SetupMoldeChecklistDataController()),
        ChangeNotifierProvider(create: (_) => SetupMoldeDataController()),
        ChangeNotifierProvider(
            create: (_) => SetupMoldeInspecaoDataController()),

        ChangeNotifierProvider(create: (_) => CCSMaquinaDataController()),

        ChangeNotifierProvider(create: (_) => InspecaoLimpezaDataController()),
        ChangeNotifierProvider(
            create: (_) => InspecaoLimpezaProdutoDataController()),
        ChangeNotifierProvider(
            create: (_) => InspecaoLimpezaMaquinaDataController()),
        ChangeNotifierProvider(
            create: (_) => InspecaoSalaLimpaItemAvaliadoDataController()),
        ChangeNotifierProvider(
            create: (_) => InspecaoLimpezaChecklistDataController()),

        ChangeNotifierProvider(create: (_) => OrdemFabricacaoDataController()),

        // Page Controllers
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

  ConsultaInspecionarControl.reset();

  InspecaoLimpezaConsultarControl.reset();
  InspecaoLimpezaControl.reset();

  InspecaoSalaLimpaConsultarControl.reset();
  InspecaoSalaLimpaControl.reset();

  ConfigAreaControl.reset();
  ConfigChecklistControl.reset();
  ConfigProdutoControl.reset();

  ItemAvaliadoControl.reset();
  SalaLimpaMaquinaMonitoradoControl.reset();
  SalaLimpaInspecaoControl.reset();

  LiberacaoMaquinaConsultarControl.reset();
  LiberacaoMaquinaControl.reset();

  SetupMoldeConsultarControl.reset();
  SetupMoldeControl.reset();

  LiberarMoldeBloqueado.reset();

  // Data Controllers
  PesquisaDataControl.reset();

  InspecaoSalaLimpaMaquinaDataControl.reset();

  AreaDataControl.reset();
  AreaProdutoDataControl.reset();
  AreaChecklistDataControl.reset();

  AcessoUsuarioDataControl.reset();
  AcessoSupervisorDataControl.reset();
  AcessoManutencaoDataControl.reset();

  ProdutoDataControl.reset();
  ChecklistDataControl.reset();

  ItemAvaliadoDataControl.reset();
  SalaLimpaMaquinaMonitoradoDataControl.reset();
  SalaLimpaInspecaoDataControl.reset();
  // SalaLimpaInspecaoMaquinaControl.reset();

  LiberacaoMaquinaChecklistDataControl.reset();
  LiberacaoMaquinaDataControl.reset();
  LiberacaoMaquinaInspecaoDataControl.reset();

  SetupMoldeChecklistDataControl.reset();
  SetupMoldeDataControl.reset();
  SetupMoldeInspecaoDataControl.reset();

  CCSMaquinaDataControl.reset();

  InspecaoLimpezaDataControl.reset();
  InspecaoLimpezaProdutoDataControl.reset();
  InspecaoLimpezaMaquinaDataControl.reset();
  InspecaoLimpezaChecklistDataControl.reset();

  OrdermFabricacaoDataControl.reset();
}
