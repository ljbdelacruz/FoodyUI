


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/components/buttons/walletButton.buttons.dart';
import 'package:foody_ui/components/text/wuiTextwidget.text.dart';
import 'package:foody_ui/typdef/mytypedef.dart';

class TextSubUI{
  static TextSubUI instance = TextSubUI();

  Widget wUITextButton(NormalCallback click, {bColor = Colors.blue, tColor = Colors.black, text = "Sample", btnLbl = "SampleBtn"}){
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: TextWidget.title(
                    text,
                    fontSize: 13,
                  ),
                ),
                Container(
                  width: 5,
                ),
                ButtonWidget.outline(
                  text: btnLbl,
                  color: bColor,
                  onTap: click,
                ),
              ],
            );
  }
}