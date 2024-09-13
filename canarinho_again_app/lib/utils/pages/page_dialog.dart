import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/utils/pages/page_button.dart';
import 'package:canarinho_again_app/utils/pages/page_const.dart';
import 'package:flutter/material.dart';

class DefaultDialog extends StatelessWidget {
  final String title;
  final String content;

  final String button;
  final double width;
  final VoidCallback onPressed;
  final Color color;

  const DefaultDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.button,
    required this.width,
    required this.onPressed,
    this.color = COLOR_00528C,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: PAGE_ELEVATION,
      title: Text(title, style: STYLE_171717_BF16),
      titlePadding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      content: Text(content, style: STYLE_171717_F16),
      actionsPadding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DefaultButton(
              margin: const EdgeInsets.only(right: 8),
              width: 112,
              child: const Text("CANCELAR", style: STYLE_FEFEFE_F12),
              onPressed: () => Navigator.pop(context),
            ),
            DefaultButton(
              width: width,
              color: color,
              onPressed: () {
                Navigator.pop(context);
                onPressed();
              },
              child: Text(button, style: STYLE_FEFEFE_F12),
            ),
          ],
        ),
      ],
    );
  }
}

class JustificativaDialog extends StatelessWidget {
  final String title;
  final String content;

  final String button;
  final double buttonHeight;
  final VoidCallback onPressed;
  final TextEditingController controller;
  final int maxLength;
  final Color color;

  const JustificativaDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.button,
    this.buttonHeight = 32,
    required this.onPressed,
    required this.controller,
    this.maxLength = 200,
    this.color = COLOR_00528C,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: PAGE_ELEVATION,
      title: Text(title, style: STYLE_171717_BF16),
      titlePadding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Text(content, style: STYLE_171717_F16),
          ),
          SizedBox(
            width: 350,
            height: 216,
            child: TextField(
              autofocus: true,
              maxLength: maxLength,
              maxLines: 20,
              controller: controller,
              decoration: const InputDecoration(
                focusedBorder: DEFAULT_BORDER,
                enabledBorder: DEFAULT_BORDER,
                errorBorder: ERROR_BORDER,
                border: DEFAULT_BORDER,
                contentPadding: EdgeInsets.all(16),
              ),
            ),
          ),
        ],
      ),
      actionsPadding: const EdgeInsets.all(8),
      actions: [
        DefaultButton(
          width: 350,
          height: buttonHeight,
          color: color,
          onPressed: onPressed,
          child: Text(button, style: STYLE_FEFEFE_F12),
        ),
      ],
    );
  }
}
