


import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/components/progress/circle_progress.dart';
import 'package:foody_ui/util/app_color_util.dart';

class PointsCard extends StatelessWidget {
  final PointsCardVM vm;
  PointsCard(this.vm);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.textBody1,
                          blurRadius:
                              5.0, // has the effect of softening the shadow
                          spreadRadius:
                              1.0, // has the effect of extending the shadow
                          offset: Offset(
                            1.0, // horizontal, move right 10
                            2.0, // vertical, move down 10
                          ),
                        )
                      ],
                      gradient: LinearGradient(
                          begin: Alignment(-1.0, -2.0),
                          end: Alignment(1.0, 2.0),
                          stops: [
                            0.20,
                            0.85,
                          ],
                          colors: [
                            AppColors.gradientOneColor,
                            AppColors.gradientTwoColor,
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -5.0,
                          child: Opacity(
                            opacity: 0.1,
                            child: Container(
                              width: 180,
                              height: 180,
                              child: Center(
                                child: Image.asset(
                                  vm.cardLogo
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(vm.tier,
                                      style: TextStyle(
                                          color: AppColors.lightWhite,
                                          fontSize: 13.0,
                                          letterSpacing: 3.0)),
                                ),
                                Container(
                                  child: Text(
                                      vm.message,
                                      style: TextStyle(
                                          color: AppColors.lightWhite,
                                          fontWeight: FontWeight.w100,
                                          fontSize: 12)),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Container(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: CustomPaint(
                                        foregroundPainter:
                                            CircleProgress(vm.animationValue),
                                        child: Container(
                                          width: 90,
                                          height: 90,
                                          child: Center(
                                              child: Container(
                                            child: Container(
                                              padding: EdgeInsets.all(5.0),
                                              width: 65,
                                              height: 65,
                                              // decoration: BoxDecoration(
                                              //     color: Colors.white, shape: BoxShape.circle),
                                              child: Center(
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                      vm.tierImage,
                                                    ),
                                                  ),
                                                )),
                                              ),
                                            ),
                                          )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                child: Text(
                                                  vm.points,
                                                  style: TextStyle(
                                                      fontSize: 28.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          vm.pointsC),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Text(vm.pCurrSymbol,
                                                    style: TextStyle(
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: vm.pointsC)),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          transform: Matrix4.translationValues(
                                              0.0, -8.0, 0.0),
                                          child: Text(
                                              vm.mileStonePoints,
                                              style: TextStyle(
                                                  color: vm.mileStonePointsC,
                                                  fontSize: 9.0,
                                                  fontWeight: FontWeight.w100)),
                                        )
                                      ],
                                    ),
                                  ],
                                ))
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  //TODO: Clicked bottom message
                },
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(vm.bottomMessage,
                        style: TextStyle(color: vm.bottomColor))),
              ),
              SizedBox(
                width: 6.0,
              ),
              Icon(Icons.chevron_right, size: 18, color: vm.bottomColor),
            ],
          ),
        ],
      ),
    );
  }

}

class PointsCardVM{
  Color text1Body;
  String tier;
  String message;
  String tierImage;
  String cardLogo;
  double animationValue;
  String points;
  String pCurrSymbol;
  Color pointsC;

  String mileStonePoints;
  Color mileStonePointsC;


  String bottomMessage;
  Color bottomColor;

  PointsCardVM(this.text1Body, this.tier, this.message, this.tierImage, this.cardLogo, this.animationValue, this.points, this.pCurrSymbol, this.pointsC, this.mileStonePoints, this.mileStonePointsC, this.bottomMessage, this.bottomColor);
}