


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

  static Widget getPrice(double myPrice, String currency, BuildContext context, {TextStyle style}) {
    if (style != null) {
      style = style.merge(TextStyle(fontSize: style.fontSize + 2));
    }
    try {
      if (myPrice == 0) {
        return Text('-', style: style ?? Theme.of(context).textTheme.subtitle1);
      }
      return RichText(
        softWrap: false,
        overflow: TextOverflow.fade,
        maxLines: 1,
        text: TextSpan(
                text: currency,
                style: style ?? Theme.of(context).textTheme.subtitle1,
                children: <TextSpan>[
                  TextSpan(text: myPrice.toStringAsFixed(2) ?? '', style: style ?? Theme.of(context).textTheme.subtitle1),
                ],
              ),
      );
    } catch (e) {
      return Text('');
    }
  }
}