import 'package:flutter/material.dart';
import 'package:test_developer_flutter/src/util/desingApp.dart';

class DataResultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
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
          _dataForm("Nombre", "value"),
          _dataForm("Año", "value"),
          _dataForm("Pantone_Value", "value"),
          _dataIcon("Color", "")
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
