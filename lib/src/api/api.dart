
import 'package:dio/dio.dart';
import 'package:test_developer_flutter/src/models/modelDataSuperHeroe.dart';

class Api {
  /*
   * Crea una unica instancia de la clase Api
   */
  Api._internal();
  static Api _instance = Api._internal();
  static Api get instance => _instance;
  /*
   * define la ruta estatica o base de la Api
   */
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://reqres.in/api'),
  );
  /*
   * retorna los datos de la Api en una Lita de tipo DataSuperHeroe
   */
  Future<List<DataSuperHeroe>> getData() async {
    try {
      final Response response = await this._dio.get('/login');
      return DataJson.fromJson(response.data).data;
    } catch (e) {
      print(
          "-------------5656-----------------------------------------------------");
      print(e);
      return null;
    }
  }
}
