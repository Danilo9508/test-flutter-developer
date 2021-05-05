import 'package:flutter/material.dart';

class AppColors {
  static Color colorPrimaryApp = Color(0XFFE77524);
  static Color colorFillApp = Color(0XFFF8E4D4);
}

class AppFonts {
  /*
   * estilo de texto para los titulos
   */
  static TextStyle styleTextTitle = TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Color(0XFF545759),
      fontFamily: 'Roboto');
  /*
   * estilo de texto para los nombre de cada propiedad (Nombre,Año).
   */
  static TextStyle styleTextName = TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      color: Color(0XFF545759),
      fontFamily: 'Roboto');
  /*
   * estilo de texto para los valores que devuleve la API
   */
  static TextStyle styleTextValue = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: Color(0XFF545759),
      fontFamily: 'Roboto');
}

extension HexColor on Color {
  /// convierte el codigo exadecimal en  string a uno compatible con Flutter
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
