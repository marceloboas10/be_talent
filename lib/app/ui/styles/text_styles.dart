import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();
  static TextStyles get instance => _instance ??= TextStyles._();

  String get primaryFont => 'Helvetica Neue';

  TextStyle get healding1 => TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontFamily: primaryFont,
      fontWeight: FontWeight.w500);

  TextStyle get healding2 => TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontFamily: primaryFont,
      fontWeight: FontWeight.w500);

  TextStyle get healding3 => TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontFamily: primaryFont,
      fontWeight: FontWeight.w400);
}

extension TextStylesExtentions on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
