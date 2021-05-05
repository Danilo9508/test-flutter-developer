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
      fontSize: 36.0,
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
