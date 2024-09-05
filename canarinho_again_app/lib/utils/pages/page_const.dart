// ignore_for_file: constant_identifier_names

import 'package:canarinho_again_app/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Page
const double PAGE_ELEVATION = 1.0;

// Text Style
const FontWeight FW_NORMAL = FontWeight.normal;
const FontWeight FW_BOLD = FontWeight.bold;

const TextStyle STYLE_FEFEFE_F10 =
    TextStyle(fontSize: 10, fontFamily: DEFAULT_FONT, fontWeight: FW_NORMAL, color: COLOR_FEFEFE);
const TextStyle STYLE_FEFEFE_F12 =
    TextStyle(fontSize: 12, fontFamily: DEFAULT_FONT, fontWeight: FW_NORMAL, color: COLOR_FEFEFE);
const TextStyle STYLE_FEFEFE_F14 =
    TextStyle(fontSize: 14, fontFamily: DEFAULT_FONT, fontWeight: FW_NORMAL, color: COLOR_FEFEFE);
const TextStyle STYLE_FEFEFE_F16 =
    TextStyle(fontSize: 16, fontFamily: DEFAULT_FONT, fontWeight: FW_NORMAL, color: COLOR_FEFEFE);
const TextStyle STYLE_FEFEFE_BF12 =
    TextStyle(fontSize: 12, fontFamily: DEFAULT_FONT, fontWeight: FW_BOLD, color: COLOR_FEFEFE);
const TextStyle STYLE_FEFEFE_BF14 =
    TextStyle(fontSize: 14, fontFamily: DEFAULT_FONT, fontWeight: FW_BOLD, color: COLOR_FEFEFE);
const TextStyle STYLE_FEFEFE_BF16 =
    TextStyle(fontSize: 16, fontFamily: DEFAULT_FONT, fontWeight: FW_BOLD, color: COLOR_FEFEFE);

const TextStyle STYLE_171717_F10 =
    TextStyle(fontSize: 10, fontFamily: DEFAULT_FONT, fontWeight: FW_NORMAL, color: COLOR_171717);
const TextStyle STYLE_171717_F12 =
    TextStyle(fontSize: 12, fontFamily: DEFAULT_FONT, fontWeight: FW_NORMAL, color: COLOR_171717);
const TextStyle STYLE_171717_F14 =
    TextStyle(fontSize: 14, fontFamily: DEFAULT_FONT, fontWeight: FW_NORMAL, color: COLOR_171717);
const TextStyle STYLE_171717_BF12 =
    TextStyle(fontSize: 12, fontFamily: DEFAULT_FONT, fontWeight: FW_BOLD, color: COLOR_171717);
const TextStyle STYLE_171717_F16 =
    TextStyle(fontSize: 16, fontFamily: DEFAULT_FONT, fontWeight: FW_NORMAL, color: COLOR_171717);
const TextStyle STYLE_171717_BF14 =
    TextStyle(fontSize: 14, fontFamily: DEFAULT_FONT, fontWeight: FW_BOLD, color: COLOR_171717);
const TextStyle STYLE_171717_BF16 =
    TextStyle(fontSize: 16, fontFamily: DEFAULT_FONT, fontWeight: FW_BOLD, color: COLOR_171717);
const TextStyle STYLE_171717_BF22 =
    TextStyle(fontSize: 22, fontFamily: DEFAULT_FONT, fontWeight: FW_BOLD, color: COLOR_171717);

const TextStyle STYLE_171717_F18 =
    TextStyle(fontSize: 18, fontFamily: DEFAULT_FONT, fontWeight: FW_NORMAL, color: COLOR_171717);

const TextStyle STYLE_171717_F20 =
    TextStyle(fontSize: 20, fontFamily: DEFAULT_FONT, fontWeight: FW_NORMAL, color: COLOR_171717);

const TextStyle STYLE_GREEN_BF14 =
    TextStyle(fontSize: 14, fontFamily: DEFAULT_FONT, fontWeight: FW_BOLD, color: COLOR_GREEN);

const TextStyle STYLE_RED_BF14 =
    TextStyle(fontSize: 14, fontFamily: DEFAULT_FONT, fontWeight: FW_BOLD, color: COLOR_RED);

// Border
const BorderRadius BORDER_RADIUS = BorderRadius.all(Radius.circular(6.0));
const BorderSide BORDER_SIDE = BorderSide(width: 0.15, color: Colors.grey);

// Border Side
const OutlineInputBorder DEFAULT_BORDER = OutlineInputBorder(borderSide: BorderSide(color: COLOR_00528C, width: 1.5));
const OutlineInputBorder DEFAULT_BORDER_GREEN =
    OutlineInputBorder(borderSide: BorderSide(color: COLOR_GREEN, width: 1.5));
const OutlineInputBorder DISABLE_BORDER = OutlineInputBorder(borderSide: BorderSide(color: COLOR_171717, width: 1.5));
const OutlineInputBorder ERROR_BORDER = OutlineInputBorder(borderSide: BorderSide(color: COLOR_RED, width: 1.5));

// Box Decoration
const Decoration BOX_DECORATION = BoxDecoration(
  color: COLOR_FEFEFE,
  borderRadius: BORDER_RADIUS,
  border: Border.symmetric(
    vertical: BorderSide(color: COLOR_FEFEFE, width: 1.5),
    horizontal: BorderSide(color: COLOR_FEFEFE, width: 1.5),
  ),
);

// Dialog
const double DIALOG_SIZE = 390.0;

// Toolbar
const double TOOLBAR_HEIGHT = 64.0;

// Sheet
const double SHEET_HEIGHT = 25.0;

// Card
const double CARD_WIDTH = 469.0;

const Color CARD_COLOR_GREEN = Color.fromARGB(255, 130, 255, 134);
const Color CARD_COLOR_YELLOW = Color.fromARGB(255, 253, 245, 129);
const Color CARD_COLOR_RED = Color.fromARGB(255, 250, 123, 123);

// Messages
const String AWAIT_MESSAGE = "Aguardando a resposta do servidor...";

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
