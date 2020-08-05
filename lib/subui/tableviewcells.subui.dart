

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/components/carditem/carditem.widget.dart';
import 'package:foody_ui/components/hero/herosample.page.dart';
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


  Widget wUICells(Widget sideItem, {text = "Title", subtitle="Subtitle" ,tColor = Colors.white, bColor = Colors.grey, uColor = Colors.grey, NormalCallback event}){
    return Container(
                padding: EdgeInsets.fromLTRB(20, 25, 15, 0),
                child: GestureDetector(
                  onTap: () {
                    if(event != null){
                      event();
                    }
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

  Widget wUITransactionCell(TableViewCellsSubUIVM vm){
    return GestureDetector(
      onTap: () {},
      child: GestureDetector(
        onTap: () {

        },
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: Container(
            width:MediaQuery.of(vm.context).size.width,
            padding:EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 25, 15, 0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: CircleAvatar(
                              backgroundColor: const Color(0xff2a4f67),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  vm.currency,
                                  style: TextStyleUtil.wUITextFieldLabel(fontSz:30, color:vm.cColor),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  vm.title,
                                  style: TextStyleUtil.wUITextFieldLabel(fontSz:18, color:vm.tColor),
                                ),
                              ),
                              Container(
                                child: Text(
                                  vm.subtitle,
                                  style: TextStyleUtil.wUITextFieldLabel(fontSz: 14, color:vm.tColor),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: Text(
                              vm.amount,
                              textAlign: TextAlign.end,
                              style: TextStyleUtil.wUITextFieldLabel(fontSz:14, color:vm.tColor)
                            ),
                          ),
                          Container(
                            child: Text(
                              vm.date,
                              textAlign: TextAlign.end,
                              style: TextStyleUtil.wUITextFieldLabel(fontSz:12, color:vm.tColor),
                            ),
                          )
                        ],
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
      ),
    );
  }
  //FOODY UI cells
  Widget fUICardWiget(BuildContext context, String tag,CardWidgetVM vm){
    return
     Hero(
       tag:tag,
       child:
     CardWidget((){
      //TODO: click direction
      print("Direction clicked");
    }, (){
      //TODO: click item
      print("Clicked item");
       Navigator.push(context,MaterialPageRoute(builder: (context) => HeroSamplePage(HeroSamplePageVM(tag, image:vm.image, title:vm.title, desc:vm.subtitle), (){})));
    },vm:vm, heroTag:""));
  }
  Widget heroWidget(BuildContext context, String tag, Widget child){
    return Hero(
       tag:tag,
       child:child,
    );
  }




}

class TableViewCellsSubUIVM{
  BuildContext context;
  Color tColor;
  Color cColor;
  String currency;
  String title;
  String subtitle;
  String amount;
  String date;
  TableViewCellsSubUIVM.transactionCell(this.context, {this.title="", this.subtitle="", this.amount="", this.date="", this.tColor = Colors.black, this.currency = "₱", this.cColor = Colors.black});

}