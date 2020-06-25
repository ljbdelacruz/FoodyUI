import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/util/string_util.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

import '../../../../typdef/mytypedef.dart';

class Badge1Cells extends StatelessWidget {
  final Badge1CellsVM vm;
  final NormalCallback click;
  Badge1Cells(this.vm, this.click);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                              onTap: click,
                              child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.only(
                                      top: 10, right: 25, bottom: 13, left: 10),
                                  width: MediaQuery.of(context).size.width,
                                  // height: 94,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(244, 245, 248, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Stack(
                                        alignment: AlignmentDirectional.center,
                                        children: <Widget>[
                                          Container(
                                            width: 70.53,
                                            height: 73.02,
                                            child: ClipPolygon(
                                              sides: 6,
                                              borderRadius: 5,
                                              child: Container(
                                                padding: EdgeInsets.all(3),
                                                color: Color.fromRGBO(
                                                    77, 147, 234, 1),
                                                child: ClipPolygon(
                                                  sides: 6,
                                                  borderRadius: 5,
                                                  child: Container(
                                                    color: Color.fromRGBO(
                                                        55, 120, 206, 1),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(vm.image),
                                                    fit: BoxFit.fitWidth)),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              Row(
                                                  children: List.generate(vm.numBadgeStar,
                                                      (index) {
                                                return Container(
                                                  width: 11,
                                                  height: 11,
                                                  margin: EdgeInsets.all(1.235),
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: AssetImage(
                                                          "assets/images/star.png"),
                                                    ),
                                                  ),
                                                );
                                              }))
                                            ],
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              vm.name,
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: Color.fromRGBO(
                                                    43, 48, 56, 1),
                                              ),
                                            ),
                                            Text(
                                              vm.review,
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 8,
                                                color: Color.fromRGBO(
                                                    114, 124, 144, 1),
                                              ),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: LinearPercentIndicator(
                                                    padding: EdgeInsets.only(
                                                        right: 10),
                                                    lineHeight: 6.0,
                                                    percent: vm.percent,
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            200, 212, 229, 1),
                                                    progressColor:
                                                        Color.fromRGBO(
                                                            0, 142, 255, 1),
                                                    trailing: Text(
                                                      (vm.percent * 100)
                                                              .toString() +
                                                          "%",
                                                      style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontSize: 8,
                                                        color: Color.fromRGBO(
                                                            114, 124, 144, 1),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            );
  }

}

class Badge1CellsVM{
  String image;
  String name;
  String review;
  int limit;
  int numBadgeStar;
  double percent;
  Badge1CellsVM(this.image, this.name, this.review, this.limit, this.numBadgeStar, this.percent){
    this.name=StringUtil.stringWithHellip(this.name, limit);
  }
}
