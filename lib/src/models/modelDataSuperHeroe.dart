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

class DataJson {
  final int page, perPage, total, totalPages;
  final List<DataSuperHeroe> data;
  DataJson({
    @required this.page,
    @required this.perPage,
    @required this.total,
    @required this.totalPages,
    @required this.data,
  });
  /*
   * parsea o deserializa los datos obtenidos de la Api 
   * y retorna un objeto DataJson
   */
  static DataJson fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    return DataJson(
        page: json['page'],
        perPage: json['per_page'],
        total: json['total'],
        totalPages: json['total_pages'],
        data: list.map((i) => DataSuperHeroe.fromJson(i)).toList());
  }
}
