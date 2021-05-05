import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_developer_flutter/src/provider/dataProvaiders.dart';
import 'package:test_developer_flutter/src/util/desingApp.dart';

class DataResultWidget extends StatelessWidget {
  final String name, pantoneValue;
  final int color;
  DataResultWidget({this.name, this.pantoneValue, this.color});
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvaider>(context);
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.orange[100],
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: dataProvider.data != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text(
                    "Datos del Superhéroe",
                    style: AppFonts.styleTextTitle,
                  ),
                ),
                _dataForm("Nombre", '${dataProvider.data.name}'),
                _dataForm("Año", '${dataProvider.data.year}'),
                _dataForm("Pantone_Value", '${dataProvider.data.pantoneValue}'),
                _dataIcon("Color", '${dataProvider.data.color}')
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sin Información",
                  style: AppFonts.styleTextTitle,
                ),
                Center(
                  child: Image.asset("assets/images/question.png"),
                ),
                Text(
                  "Presiona el siguiente Botón para buscar",
                  style: AppFonts.styleTextValue,
                ),
              ],
            ),
    );
  }

  Widget _dataForm(String name, String value) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: AppFonts.styleTextName,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: AppColors.colorFillApp.withOpacity(0.9),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              value,
              style: AppFonts.styleTextValue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dataIcon(String name, String value) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: AppFonts.styleTextName,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.accessibility_new,
                size: 60,
                color: HexColor.fromHex(value),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
