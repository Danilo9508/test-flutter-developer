import 'package:flutter/cupertino.dart';

class DataSuperHeroe {
  final String name, color, pantoneValue;
  final int id, year;
  DataSuperHeroe({
    @required this.id,
    @required this.name,
    @required this.year,
    @required this.color,
    @required this.pantoneValue,
  });
 /*
 * parsea o deserializa los datos obtenidos de la Api 
 * y retorna un objeto DataSuperHeroe
 */
  static DataSuperHeroe fromJson(Map<String, dynamic> json) {
    return DataSuperHeroe(
      id: json['id'],
      name: json['name'],
      year: json['year'],
      color: json['color'],
      pantoneValue: json['pantone_value'],
    );
  }
}
