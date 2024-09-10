// ignore_for_file: non_constant_identifier_names

import 'package:canarinho_again_app/app_provider.dart';
import 'package:canarinho_again_app/controllers/app_controller.dart';
import 'package:canarinho_again_app/controllers/default_controllers/acesso_controller.dart';
import 'package:canarinho_again_app/controllers/page_controllers/login_page_controller.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

final BuildContext context = appKey.currentContext!;

final AppControl = Provider.of<AppController>(context, listen: false);
final AcessoControl = Provider.of<AcessoController>(context, listen: false);

final LoginPageControl =
    Provider.of<LoginPageController>(context, listen: false);
