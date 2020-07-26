


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/components/carditem/carditem.widget.dart';
import 'package:foody_ui/services/color.service.dart';
import 'package:foody_ui/subui/incrementor.subui.dart';
import 'package:foody_ui/subui/tableviewcells.subui.dart';
import 'package:foody_ui/subui/textfields.subui.dart';
import 'package:foody_ui/typdef/mytypedef.dart';

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
  Widget tableViewCells(BuildContext context){
    return Container(
      padding:EdgeInsets.only(left:20, right:20),
      child:Column(children:[
        TableViewCellsSubUI.instance.fUICardWiget(context,"tag1",CardWidgetVM("1ee", "1 km", title:"Title 1", subtitle:"Test Info here", image:"https://nerdreactor.com/wp-content/uploads/2017/09/490bcbdfb730adb3dbcf33cd9301622e-thor-avengers-loki-thor.jpg"))
      ]));
  }
  Widget incrementor(NormalCallback increment, NormalCallback decrement, String data){
      return Container(
          padding:EdgeInsets.only(left:20, right:20),
          child:Column(children:[
            IncrementorSubUI.instance.fUIincrement(decrement, increment, data)
          ])
      );
  }

}