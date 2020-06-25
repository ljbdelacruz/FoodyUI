


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../typdef/mytypedef.dart';

class ModalDialogService{
  static info(BuildContext context, GlobalKey<FormState> formKey, String message, String btn1, NormalCallback btn1Click){
        showDialog(
                context: context,
                builder: (BuildContext context) {
                return AlertDialog(
                      contentPadding: EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                      content: Container(
                        child:Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Form(
                            key: formKey,
                            child: Container(
                              width:MediaQuery.of(context).size.width,
                              child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children:[
                                Padding(padding:EdgeInsets.fromLTRB(20, 30, 20, 10), child:Text(message, textAlign: TextAlign.center, style:TextStyle(fontSize:15)),),
                                OutlineButton(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
                                  borderSide: BorderSide(color:Colors.transparent),
                                  onPressed: (){
                                    btn1Click();
                                }, child: Text(btn1, style:TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.bold)))
                              ],
                            ),
                          )
                          ),
                        ],
                      ),
                    )
          );
      });
    
  }
}