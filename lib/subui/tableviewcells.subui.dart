

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/subui/buttons.subui.dart';
import 'package:foody_ui/typdef/mytypedef.dart';
import 'package:foody_ui/util/text_style_util.dart';

class TableViewCellsSubUI{
  static TableViewCellsSubUI instance = TableViewCellsSubUI();

  //TODO: walletUI TB Cells
  Widget wUITBCellIcon1({text="Title", subtitle = "Subtitle", tColor = Colors.white, bColor = Colors.grey, uColor = Colors.grey}){
    return wUICells(Icon(Icons.arrow_forward_ios,color:tColor), tColor:tColor, bColor:bColor, uColor:uColor);
  }
  Widget wUITBCellToggle1(bool value, NormalCallback toggle, {text = "Title", subtitle="Subtitle" ,tColor = Colors.white, bColor = Colors.grey}){
    return wUICells(ButtonSubUI.instance.wUISwitch(value:value), tColor:tColor, bColor:bColor);
  }


  Widget wUICells(Widget sideItem, {text = "Title", subtitle="Subtitle" ,tColor = Colors.white, bColor = Colors.grey, uColor = Colors.grey}){
    return Container(
                padding: EdgeInsets.fromLTRB(20, 25, 15, 0),
                child: GestureDetector(
                  onTap: () {
                    print("Dark Mode Pressed");
                  },
                  child: Container(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: CircleAvatar(
                                      backgroundColor: bColor,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.settings,
                                          color: tColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 14,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          text,
                                          style: TextStyleUtil.wUITextFieldLabel(fontSz:14, color:tColor),
                                        ),
                                      ),
                                      Container(
                                        height: 2,
                                      ),
                                      Container(
                                        child: Text(
                                          subtitle,
                                          style: TextStyleUtil.wUITextFieldLabel(fontSz:11, color:tColor)
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                child: sideItem,
                              ),
                            ],
                          ),
                          Container(
                            height: 14,
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                              child: Container(
                                height: 1,
                                color: const Color(0xff23475d),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              );
  }

}