import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();
  static TextStyles get instance => _instance ??= TextStyles._();

  String get primaryFont => 'Helvetica';

  TextStyle get healding1 => TextStyle(fontSize: 20, color: Colors.black, fontFamily: primaryFont, fontWeight: FontWeight.w600);
  TextStyle get healding2 => TextStyle(fontSize: 16, color: Colors.black, fontFamily: primaryFont, fontWeight: FontWeight.w600);
  TextStyle get healding3 => TextStyle(fontSize: 16, color: Colors.black, fontFamily: primaryFont, fontWeight: FontWeight.normal);
}

extension TextStylesExtentions on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
