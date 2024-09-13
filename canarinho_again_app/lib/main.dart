import 'package:canarinho_again_app/app_injections.dart';
import 'package:canarinho_again_app/app_provider.dart';
import 'package:flutter/material.dart';

void main() {
  injectDependency();
  runApp(AppProvider());
}
  