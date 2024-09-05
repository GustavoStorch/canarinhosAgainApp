import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/utils/pages/page_background.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  final bool barHeight;
  final AppBar? appBar;
  final Widget? bottomSheet;

  const LoadingPage({
    Key? key,
    this.barHeight = true,
    this.appBar,
    this.bottomSheet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return PageBackground(
      barHeight: barHeight,
      appBar: appBar,
      bottomSheet: bottomSheet,
      child: Transform.translate(
        offset: Offset(0, (size.height / 2) - (barHeight ? 150 : 75)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/canarinhoagain/images/logo_canarinho.png"),
            Transform.translate(
              offset: const Offset(0, 52),
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  backgroundColor: Colors.grey[400],
                  valueColor: const AlwaysStoppedAnimation(COLOR_FEFEFE),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
