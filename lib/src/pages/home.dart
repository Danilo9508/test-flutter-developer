import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_developer_flutter/src/provider/dataProvaiders.dart';
import 'package:test_developer_flutter/src/util/desingApp.dart';
import 'package:test_developer_flutter/src/util/navigator.dart';
import 'package:test_developer_flutter/src/widgets/appBarWidget.dart';
import 'package:test_developer_flutter/src/widgets/dataResultWidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double screenHeight = 0, screenWidth = 0;
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    final dataProvider = Provider.of<DataProvaider>(context);
    await dataProvider.getData();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        MyNavigator.goToSplash(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.colorPrimaryApp,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                padding: EdgeInsets.only(top: 25, bottom: 30),
                child: Stack(
                  children: <Widget>[
                    _buildHeader(),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          DataResultWidget(),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            width: screenWidth,
                            height: 90,
                            child: RaisedButton(
                              onPressed: () {},
                              padding: EdgeInsets.all(15.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  30.0,
                                ),
                              ),
                              color: AppColors.colorPrimaryApp,
                              child: Text(
                                'Buscar Superhéroe',
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.5,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*
   * cramos la cabecera del diseño (appBar).
   * return: Widget Column
   */
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppBarWidget(), // clase con el diño de la cabecera
      ],
    );
  }
}
