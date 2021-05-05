import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Prueba Técnica",
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        Container(
          width: _screenWidth / 3,
          height: 50,
          margin: EdgeInsets.all(16),
          child: Image.asset("assets/images/logo.png"),
        ),
      ],
    );
  }
}
