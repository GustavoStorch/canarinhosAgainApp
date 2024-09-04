import 'package:canarinho_again_app/utils/app_injections.dart';
import 'package:canarinho_again_app/utils/app_provider.dart';
import 'package:flutter/material.dart';

void main() {
  injectDependency();
  runApp(AppProvider());
}
