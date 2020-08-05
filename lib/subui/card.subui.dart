

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardSubUI{
  static CardSubUI instance = CardSubUI();

  Widget wUICard1(Widget content, {Color bgColor = Colors.grey}){
    return  Container(
              padding: EdgeInsets.fromLTRB(18.3, 0, 18.3, 0),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff000000).withOpacity(0.25),
                        // color:bgColor,
                        blurRadius:
                            15.0, // has the effect of softening the shadow
                        spreadRadius:
                            0.5, // has the effect of extending the shadow
                        offset: Offset(
                          0.0, // horizontal, move right 10
                          10.0, // vertical, move down 10
                        ),
                      ),
                    ],
                    color: const Color(0xff1c3a4d),
                    borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child:content
    )
    );
  }

  Widget dUICard(BuildContext context, Widget content, {Color bgColor = Colors.white, double width = 292}){
    return Container(
      width: width,
      margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.1), blurRadius: 15, offset: Offset(0, 5)),
        ],
      ),
      child:content
    );
  }
}
















