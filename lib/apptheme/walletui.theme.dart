



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/subui/avatar.subui.dart';
import 'package:foody_ui/subui/buttons.subui.dart';
import 'package:foody_ui/subui/card.subui.dart';
import 'package:foody_ui/subui/tableviewcells.subui.dart';
import 'package:foody_ui/subui/tabs.subui.dart';
import 'package:foody_ui/subui/text.subui.dart';
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
        ButtonSubUI.instance.wUISwitch(),
        ButtonSubUI.instance.wUINotifButton(1, (){}),
        ButtonSubUI.instance.wUIButton1("Button 1", (){}),
        ButtonSubUI.instance.wUIButton2("Button 2", (){})
    ]));
  }
  Widget text(NormalCallback click){
    return Container(
      padding:EdgeInsets.only(left:20),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          TextSubUI.instance.wUITextButton(click, text:"Template 1", btnLbl:"Temp Btn 1")
    ]));
  }

  Widget tableViewCells(BuildContext context, bool value, NormalCallback click){
    return Column(children:[
      TableViewCellsSubUI.instance.wUITBCellIcon1(tColor:Colors.black),
      TableViewCellsSubUI.instance.wUITBCellToggle1(value, click, tColor:Colors.black),
      TableViewCellsSubUI.instance.wUITransactionCell(TableViewCellsSubUIVM.transactionCell(context, title:"Hello world", subtitle:"Best Buy", date:"5 Dec, 2020", amount:"₱ 100")),
    ]);
  }

  Widget tabs(BuildContext context, TabController controller){
    return Container(width:MediaQuery.of(context).size.width, child:Column(children:[
      Container(height:50, child: TabsSubUI.instance.wUITabs(["Settings", "Profile"], controller))
    ]));
  }
  Widget avatars(){
    return Container(child:Column(children:[
      AvatarSubUI.instance.wUIAvatarImage1( WUIAvatarStyle("https://nerdreactor.com/wp-content/uploads/2017/09/490bcbdfb730adb3dbcf33cd9301622e-thor-avengers-loki-thor.jpg", isNetworkImage: true, width:100, height:100)),
    ]));
  }

  Widget cards(){
    return Container(child:Column(children:[
      Container(
        width:200,
        height:80,
        child:CardSubUI.instance.wUICard1(Column(children:[
          Text("Card 1")
        ]))
      )
    ]));
  }
}