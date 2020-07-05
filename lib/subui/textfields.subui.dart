


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/components/textfields/delivery.textfields.dart';
import 'package:foody_ui/services/color.service.dart';
import 'package:foody_ui/typdef/mytypedef.dart';
import 'package:foody_ui/util/text_style_util.dart';

class TextFieldSubUI{
  static TextFieldSubUI instance = TextFieldSubUI();

  //TODO: Search TextFields
  Widget searchTextField1(BuildContext context, TextEditingController controller, String placeholder, double width, NormalCallback searchItem, {Color tColor = Colors.grey, Color uColor = Colors.grey, double height = 40}){
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
        Padding(padding:EdgeInsets.only(left:20), child:Icon(Icons.search, color:Colors.grey, size:25)),
        Container(
          width:width,
          height:height,
          child:TextField(
            controller: controller, 
            decoration: InputDecoration(counterText: "", 
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: uColor),   
                      ),
                      hintText: placeholder,
                      fillColor: tColor,
                      labelStyle: TextStyle(color:tColor),
                      focusColor: tColor,
            ),
            onEditingComplete:(){
            searchItem();
          }))
      ]);
  }

  //TODO: TextFields
  Widget textFieldButton1(BuildContext context, TextEditingController controller, bool isObscure, String lbl, String btn, NormalCallback callback, {Color textColor = Colors.white, Color bColor = Colors.grey, double width = 100, IconData icon = Icons.perm_contact_calendar}){
    return Container(
        height:100,
        padding:EdgeInsets.all(5), child: Stack(children: [
            Positioned(top: 10, child:Container(
              width:width,
              height:80,
              child:Stack(children:[
            textPosition(btn, lbl),
            Positioned(top: 30, child:Container(
              width:width,
              height:50,
              decoration: BoxDecoration(
                border: Border.all(color:bColor),
                color: Colors.transparent,
              ),
              child: Padding(padding:EdgeInsets.all(5),child:
              Row(children:[
                Container(
                  width:MediaQuery.of(context).size.width - 112,
                  height: 40,
                  child:TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [new WhitelistingTextInputFormatter(RegExp("[0-9]")),],
                  style: TextStyle(color:ColorsService.instance.primaryColor(), fontSize:15),
                  controller: controller,
                  maxLength: 11,
                  obscureText: isObscure,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(labelText: "", counterText: "", 
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  labelStyle: TextStyle(color:Colors.white),
                  focusColor: Colors.white,
                ),)),
                GestureDetector(onTap:callback, child: Icon(icon, color:ColorsService.instance.primaryColor(), size: 30))
              ])
            )
            )
            )
            ],)))
        ]));
  }

  Widget textPosition(String btn, String lbl, {Color tColor = Colors.grey}){
     return Container(
       height:20,
       child: Stack(children:[
          Positioned(left:0, child: Text(lbl, style:TextStyle(color:tColor))),
     ]));
  }


  //TODO: WalletUI TextField
  Widget wUITextField1(String placeholder, {Color tColor = Colors.white, double lfontSz = 10, double cfontSz=13}){
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(27.9, 0, 27.9, 0),
                    child: Text(
                      placeholder,
                      style: TextStyleUtil.wUITextFieldLabel(color:tColor, fontSz:lfontSz),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(27.9, 0, 27.9, 0),
                    child: TextField(
                        style: TextStyleUtil.wUITextFieldLabel(color:tColor, fontSz:cfontSz),
                        obscureText: false,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  )
    ]);
  }



  //TODO: Delivery UI
  Widget dfUITextField1(TextEditingController controller, String label, {placeholder="", tColor = Colors.white, bColor = Colors.white, iColor = Colors.white}){
    return DeliveryTextFields(DeliveryTextFieldsVM(controller, label, placeholder:placeholder, labelStyleColor: tColor, bColor:bColor, iconColor: iColor));
  }
  Widget dfUITextfield1Pass(TextEditingController controller, String label, {placeholder="", tColor = Colors.white, bColor = Colors.white, iColor = Colors.white}){
    return DeliveryTextFields(DeliveryTextFieldsVM(controller, label, placeholder:placeholder, isObscure: true, labelStyleColor: tColor, bColor:bColor, iconColor: iColor));
  }



  //LJTheme
  Widget ljUITextField1({placeholder = "", tColor = Colors.black, bColor = Colors.black, lfontSz = 10.0, cfontSz = 13.0}){
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding:EdgeInsets.only(bottom:5),
                    // padding: EdgeInsets.fromLTRB(27.9, 0, 27.9, 0),
                    child: Text(
                      placeholder,
                      style: TextStyleUtil.wUITextFieldLabel(color:tColor, fontSz:lfontSz),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color:bColor),
                      color: Colors.transparent,
                    ),
                    padding: EdgeInsets.all(5),
                    child: TextField(
                        style: TextStyleUtil.wUITextFieldLabel(color:tColor, fontSz:cfontSz),
                        obscureText: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: tColor,
                          ),
                        )
                        
                        ),
                  )
    ]);
  }
}