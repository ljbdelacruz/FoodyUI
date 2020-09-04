



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/pages/test/deliveryfood/testproductinfo.page.dart';
import 'package:foody_ui/pages/test/deliveryfood/teststoreinfo.page.dart';

class NavigatorService{

  static navigateToTestProductInfo(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (context) => TestProductInfoPage()));
  }
  static navigateToTestStoreInfo(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (context) => TestStoreInfoPage()));
  }

}