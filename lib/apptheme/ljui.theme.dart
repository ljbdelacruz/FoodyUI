


import 'package:flutter/widgets.dart';
import 'package:foody_ui/subui/textfields.subui.dart';

class LJThemeUI{
  static LJThemeUI instance = LJThemeUI();


  Widget textFields(TextEditingController controller){
    return Container(
      padding:EdgeInsets.all(20),
      child: Column(children:[
        TextFieldSubUI.instance.ljUITextField1(controller,placeholder:"Test TF 1")
    ]));
  }

}