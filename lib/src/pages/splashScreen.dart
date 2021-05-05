import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_developer_flutter/src/provider/dataProvaiders.dart';
import 'package:test_developer_flutter/src/util/desingApp.dart';
import 'package:test_developer_flutter/src/util/navigator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _scaleController;
  AnimationController _scale2Controller;
  AnimationController _widthController;
  AnimationController _positionController;

  Animation<double> _scaleAnimation;
  Animation<double> _scale2Animation;
  Animation<double> _widthAnimation;
  Animation<double> _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                _widthController.forward();
              }
            },
          );

    _widthController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _widthAnimation =
        Tween<double>(begin: 80.0, end: 300.0).animate(_widthController)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                _positionController.forward();
              }
            },
          );

    _positionController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _positionAnimation =
        Tween<double>(begin: 0.0, end: 215.0).animate(_positionController)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                setState(
                  () {
                    hideIcon = true;
                  },
                );
                _scale2Controller.forward();
              }
            },
          );

    _scale2Controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _scale2Animation =
        Tween<double>(begin: 1.0, end: 32.0).animate(_scale2Controller)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                MyNavigator.goToHome(context);
                getData(context);
              }
            },
          );
  }

  void getData(BuildContext context) async {
    final dataProvider = Provider.of<DataProvaider>(context);
    await dataProvider.getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _screenHeight = MediaQuery.of(context).size.height;
    final double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: _screenHeight,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset("assets/images/programing.png"),
                    ),
                    SizedBox(
                      height: _screenHeight / 10,
                    ),
                    Text(
                      "Prueba Técnica",
                      style: AppFonts.styleTextTitle,
                    ),
                    Text(
                      "Desarrollador Frontend-Flutter",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color(0XFFE97A23),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Presiona para Iniciar",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AnimatedBuilder(
                      animation: _scaleController,
                      builder: (context, child) => Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Center(
                          child: AnimatedBuilder(
                            animation: _widthAnimation,
                            builder: (context, child) => Container(
                              width: _widthAnimation.value,
                              height: 80.0,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: AppColors.colorFillApp,
                              ),
                              child: InkWell(
                                onTap: () {
                                  _scaleController.forward();
                                },
                                child: Stack(children: [
                                  AnimatedBuilder(
                                    animation: _positionController,
                                    builder: (context, child) => Positioned(
                                      left: _positionAnimation.value,
                                      child: AnimatedBuilder(
                                        animation: _scale2Controller,
                                        builder: (
                                          context,
                                          child,
                                        ) =>
                                            Transform.scale(
                                          scale: _scale2Animation.value,
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.colorPrimaryApp,
                                            ),
                                            child: hideIcon == false
                                                ? Icon(
                                                    Icons.arrow_forward,
                                                    color: Colors.white,
                                                    size: 50,
                                                  )
                                                : Container(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      width: _screenWidth / 2.0,
                      child: Image.asset("assets/images/logo.png"),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
