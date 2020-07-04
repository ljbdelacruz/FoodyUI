
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


}