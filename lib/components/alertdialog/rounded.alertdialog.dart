import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundedAlertDialog{

  //rounded dialog1
  static showDialog1(BuildContext context, double radius, GlobalKey<FormState> formKey, List<Widget> widgets){
    showDialog(
                context: context,
                builder: (BuildContext context) {
                return AlertDialog(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(radius))),
                      content: Container(
                        child:Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children:widgets,
                            ),
                          ),
                        ],
                      ),
                    )
          );
      });
    }
}