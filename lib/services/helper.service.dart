


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/services/color.service.dart';


class HelperService{

  static List<Icon> getStarsList(double rate, {double size = 18, Color starColor}) {
    if(starColor == null){
      starColor = ColorsService.instance.halfStar();
    }
    var list = <Icon>[];
    list = List.generate(rate.floor(), (index) {
      return Icon(Icons.star, size: size, color: starColor);
    });
    if (rate - rate.floor() > 0) {
      list.add(Icon(Icons.star_half, size: size, color: starColor));
    }
    list.addAll(List.generate(5 - rate.floor() - (rate - rate.floor()).ceil(), (index) {
      return Icon(Icons.star_border, size: size, color: starColor);
    }));
    return list;
  }
  static String skipHtml(String htmlString) {
    // try {
    //   var document = parse(htmlString);
    //   String parsedString = parse(document.body.text).documentElement.text;
    //   return parsedString;
    // } catch (e) {
    //   return '';
    // }
  }
}