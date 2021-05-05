import 'dart:ffi';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:test_developer_flutter/src/api/api.dart';
import 'package:test_developer_flutter/src/models/modelDataSuperHeroe.dart';

class DataProvaider with ChangeNotifier {
  List<DataSuperHeroe> _listData;
  DataSuperHeroe data;
  bool stateDataApi;
/*
 * obtiene los datos de la Api y notifica
 */
  getData() async {
    _listData = await Api.instance.getData();
    _listData != null ? stateDataApi = true : stateDataApi = false;
    notifyListeners();
  }

/*
 * busca el primer valor que coicide en la busqueda y los asigna a la variable data
 */
  getDataId(int id) {
    data = _listData.firstWhere((element) => element.id == id);
    notifyListeners();
  }
}
