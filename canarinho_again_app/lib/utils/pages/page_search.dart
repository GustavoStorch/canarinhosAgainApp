import 'package:canarinho_again_app/app_const.dart';
import 'package:canarinho_again_app/utils/pages/page_const.dart';
import 'package:flutter/material.dart';

class PageSearch extends StatelessWidget {
  const PageSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CARD_WIDTH,
      padding: const EdgeInsets.all(0),
      child: const Card(
        margin: EdgeInsets.symmetric(vertical: 12),
        elevation: PAGE_ELEVATION,
        child: TextField(
          // onChanged: (value) => PesquisaDataControl.defineFiltro(value),
          autofocus: true,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: "Buscar por...",
            labelStyle: STYLE_171717_F16,
            hintText: "Buscar por...",
            hintStyle: STYLE_171717_F18,
            focusedBorder: DEFAULT_BORDER,
            enabledBorder: DEFAULT_BORDER,
            border: DEFAULT_BORDER,
            contentPadding: EdgeInsets.all(16),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.search_rounded, color: COLOR_00528C, size: 25),
            ),
          ),
        ),
      ),
    );
  }
}
