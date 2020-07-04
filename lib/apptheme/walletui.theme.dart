



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/subui/buttons.subui.dart';
import 'package:foody_ui/subui/textfields.subui.dart';
import 'package:foody_ui/typdef/mytypedef.dart';

class WalletUITheme{
  static WalletUITheme instance = WalletUITheme();
  
  Widget walletUITextFields(BuildContext context){
    return Container(
      // color:Colors.black,
      child:Column(children:[
        TextFieldSubUI.instance.wUITextField1("Email or Username", tColor:Colors.grey)
    ]));
  }
  Widget walletUIButtons(BuildContext context, bool value, NormalCallback click){
    return Container(
      padding:EdgeInsets.only(left:20),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
        ButtonSubUI.instance.wUIRadioButton(value, click),
        SizedBox(height:30),
        ButtonSubUI.instance.wUISwitch()
    ]));
  }



}