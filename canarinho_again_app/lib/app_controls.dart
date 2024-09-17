// ignore_for_file: non_constant_identifier_names

import 'package:canarinho_again_app/app_provider.dart';
import 'package:canarinho_again_app/controllers/app_controller.dart';
import 'package:canarinho_again_app/controllers/data_controllers/consulta_passagem/consulta_passagem_data_controller.dart';
import 'package:canarinho_again_app/controllers/data_controllers/pesquisa_data_controller.dart';
import 'package:canarinho_again_app/controllers/data_controllers/usuario/usuario_data_controller.dart';
import 'package:canarinho_again_app/controllers/default_controllers/acesso_controller.dart';
import 'package:canarinho_again_app/controllers/default_controllers/configuracao/config_usuario_controller.dart';
import 'package:canarinho_again_app/controllers/default_controllers/consulta_passagem/consulta_passagem_controller.dart';
import 'package:canarinho_again_app/controllers/page_controllers/login_page_controller.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

final BuildContext context = appKey.currentContext!;

final AppControl = Provider.of<AppController>(context, listen: false);
final AcessoControl = Provider.of<AcessoController>(context, listen: false);

final LoginPageControl =
    Provider.of<LoginPageController>(context, listen: false);

final ConfigUsuarioControl =
    Provider.of<ConfigUsuarioController>(context, listen: false);

    // DATA CONTROLLERS
final PesquisaDataControl =
    Provider.of<PesquisaDataController>(context, listen: false);

final UsuarioDataControl = Provider.of<UsuarioDataController>(context, listen: false);

final ConsultaPassagemDataControl = Provider.of<ConsultaPassagemDataController>(context, listen: false);

final ConsultaPassagemControl = Provider.of<ConsultaPassagemController>(context, listen: false);
