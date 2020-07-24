


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoaderSubUI{
  static LoaderSubUI instance = LoaderSubUI();


  Widget circularLoader({Color color = Colors.grey}){
    return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color),
    );
  }

}