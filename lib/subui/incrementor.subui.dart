




import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/typdef/mytypedef.dart';
import 'package:foody_ui/util/text_style_util.dart';

class IncrementorSubUI{
  static IncrementorSubUI instance = IncrementorSubUI();
  
  Widget fUIincrement(NormalCallback decrement, NormalCallback increment, String data, {Color tColor = Colors.black, double fontSz=12, double iconSz = 30}){
    return Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                onPressed: decrement,
                iconSize: iconSz,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                icon: Icon(Icons.remove_circle_outline),
                color: tColor,
              ),
              Text(data, style: TextStyleUtil.textBold(tColor:tColor, fontSz:fontSz)),
              IconButton(
                onPressed: increment,
                iconSize: iconSz,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                icon: Icon(Icons.add_circle_outline),
                color: tColor,
              )
            ],
          );
  }
}