import 'package:canarinho_again_app/utils/pages/page_const.dart';
import 'package:flutter/material.dart';

class PageBackground extends StatelessWidget {
  final AppBar? appBar;
  final Widget? bottomSheet;
  final Widget? child;
  final Widget? floatingActionButton;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool? resizeToAvoidBottomInset;
  final bool barHeight;

  const PageBackground({
    Key? key,
    this.appBar,
    this.bottomSheet,
    this.floatingActionButton,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.resizeToAvoidBottomInset,
    required this.child,
    this.barHeight = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = barHeight ? (size.height - TOOLBAR_HEIGHT - SHEET_HEIGHT) : double.infinity;

    return Scaffold(
      appBar: appBar,
      bottomSheet: bottomSheet,
      floatingActionButton: floatingActionButton,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      floatingActionButtonLocation: floatingActionButtonLocation,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Container(
        width: double.infinity,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/canarinhoagain/images/wallpaper_canarinho.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
