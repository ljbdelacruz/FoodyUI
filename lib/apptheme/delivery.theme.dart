


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/services/color.service.dart';
import 'package:foody_ui/subui/textfields.subui.dart';

class DeliveryUITheme{
  static DeliveryUITheme instance = DeliveryUITheme();

  Widget deliveryUITextFields(BuildContext context, TextEditingController controller){
    return Container(
      padding:EdgeInsets.only(left:20, right:20),
      child:Column(children:[
        SizedBox(height:30),
        TextFieldSubUI.instance.dfUITextField1(controller, "Email or Username", iColor:Colors.grey, tColor:Colors.grey, bColor:ColorsService.instance.primaryColor()),
        SizedBox(height:30),
        TextFieldSubUI.instance.dfUITextfield1Pass(controller, "Password", placeholder:"****************", iColor:Colors.grey, tColor:Colors.grey, bColor:ColorsService.instance.primaryColor())
    ]));
  }

}