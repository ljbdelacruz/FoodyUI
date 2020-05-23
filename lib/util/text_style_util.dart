
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextStyleUtil{
  static TextStyle get itemCellAvailable{
    return TextStyle(color:Colors.yellow, fontSize: 9);
  }
  static TextStyle get itemCellUnavailable{
    return TextStyle(color:Colors.red, fontSize: 9);
  }
}