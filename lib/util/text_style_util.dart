
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextStyleUtil{
  static TextStyle get itemCellAvailable{
    return TextStyle(color:Colors.yellow, fontSize: 9);
  }
  static TextStyle get itemCellUnavailable{
    return TextStyle(color:Colors.red, fontSize: 9);
  }
  static TextStyle get productTitle{
    return TextStyle(color:Colors.black, fontSize: 9);
  }
  static TextStyle get productPrice{
    return TextStyle(color:Colors.black, fontSize: 12);
  }
  static TextStyle wUITextFieldLabel({Color color = Colors.white, double fontSz = 10}){
    return TextStyle(color:color, fontSize:fontSz, fontWeight: FontWeight.bold);
  }

  static TextStyle alertBtn(fontSize, Color color){
    return TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize, color: color);
  }
  static TextStyle normal(double fontSize, Color color){
    return TextStyle(fontSize: fontSize, color:color);
  }

  static TextStyle textBold({double fontSz=10, Color tColor = Colors.black}){
    return TextStyle(fontSize:fontSz, fontWeight: FontWeight.bold, color: tColor);
  }
  static TextStyle textNormal({double fontSz=10, Color tColor = Colors.black}){
    return TextStyle(fontSize:fontSz, color: tColor);
  }
  static TextStyle textUnderlinedNormal({double fontSz=10, Color tColor = Colors.black}){
    return TextStyle(fontSize:fontSz, color: tColor, decoration: TextDecoration.underline);
  }



}


