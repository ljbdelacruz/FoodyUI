



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/components/buttons/switch.buttons.dart';
import 'package:foody_ui/components/buttons/walletButton.buttons.dart';
import 'package:foody_ui/services/color.service.dart';
import 'package:foody_ui/typdef/mytypedef.dart';

class ButtonSubUI{
  static ButtonSubUI instance = ButtonSubUI();

  //TODO: Buttons WalletUI
  Widget wUIButton1(String title, NormalCallback click){
    return ButtonWidget(
              text: title,
              onTap: click,
    );
  }
  Widget wUIButton2(String title, NormalCallback click, {Color bColor = Colors.yellow}){
    return ButtonWidget.outline(
                  text: "Sign up",
                  color: ColorsService.instance.yellowColor(),
                  onTap: click,
    );
  }
  Widget wUIButton1Logo(String title, NormalCallback click, {Color tColor = Colors.white, Color bColor = Colors.yellow, IconData icon = Icons.access_alarm}){
    return ButtonWidget.icon(
            text: title,
            backgroudColor: bColor,
            color: tColor,
            icon: Icon(icon, size: 20, color: tColor),
            onTap: click,
    );
  }
  Widget wUIRadioButton(bool value, NormalCallback click, {bColor = Colors.grey, cbColor = Colors.white, selColor = Colors.red}){
    return Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            border: Border.all(color: bColor),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 250),
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: value == true ? selColor : cbColor,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Container(
                                child: Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: Colors.transparent),
                              child: Checkbox(
                                checkColor: Colors.white,
                                value: value,
                                onChanged: (value) {
                                  print("Selected value");
                                  print(value);
                                  click();
                                },
                                activeColor: Colors.transparent,
                              ),
                            )),
                          ),
                        ),
                      ); 
  }
  Widget wUISwitch({value = false}){
    return SwitchWidget(value:value);
  }




}