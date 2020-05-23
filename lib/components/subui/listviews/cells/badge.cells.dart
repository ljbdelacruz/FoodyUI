


import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/util/shape_style_util.dart';
import 'package:foody_ui/util/string_util.dart';

class BadgeCells extends StatelessWidget {
  final BadgeCellsVM vm;
  BadgeCells(this.vm);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            child: RawMaterialButton(
              elevation: 0.0,
              fillColor: Colors.blue[600],
              shape: ShapeStyleUtil.shapePolygon,
              onPressed: () {

              },
              child: Center(
                child: Container(
                  width: 40,
                  height: 40,
                  child: Image.asset(
                    vm.image
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: _rateBadgeNoStars(vm.badgeStar),
          ),
          Wrap(
            children: List.generate(vm.numBadgeStar, (index) {
              return _rateBadgeStars();
            }),
          ),
          Text(vm.name,
              style: TextStyle(color: Colors.black54, fontSize: 14))
        ],
      ),
    );
  }


  Widget _rateBadgeNoStars(int checkStar) {
    if (checkStar == 0) {
      return Icon(
        Icons.star,
        color: Colors.transparent,
        size: 18,
      );
    }
  }
  Widget _rateBadgeStars() {
    return Icon(
      Icons.star,
      color: Colors.orange[400],
      size: 18,
    );
  }


}

class BadgeCellsVM{
  String image;
  String name;
  int limit;
  int badgeStar;
  int numBadgeStar;
  BadgeCellsVM(this.image, this.name, this.limit, this.badgeStar, this.numBadgeStar){
    this.name=StringUtil.stringWithHellip(this.name, limit);
  }
}