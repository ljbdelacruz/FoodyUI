import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foody_ui/services/color.service.dart';
import 'package:foody_ui/typdef/mytypedef.dart';
import 'package:foody_ui/util/text_style_util.dart';

class ButtonLoader extends StatefulWidget{
  final ButtonLoaderVM vm;
  final NormalCallback onButtonClick;
  final NormalCallback loaderComplete;
  //0-no animation, 1-start animation, 2-end animation success
  ButtonLoader(this.vm, this.onButtonClick, this.loaderComplete);
  @override
  _ButtonLoader createState() => _ButtonLoader();
}
class _ButtonLoader extends State<ButtonLoader> {
    bool buttonEnabled=true;
    @override
    Widget build(BuildContext context) {
      return Column(children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(0),
              child: new MaterialButton(
                child: setUpButtonChild(),
                onPressed: () {
                  setState(() {
                    if (widget.vm.mystate == 0) {
                      animateButton();
                    }
                  });
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.vm.bRadius)),
                enableFeedback: this.buttonEnabled,
                elevation: 4.0,
                minWidth: double.infinity,
                height: widget.vm.bHeight,
                color: widget.vm.isEnabled ? widget.vm.bgColor : widget.vm.disableC,
              ),
            )
          ],);
    }

    Widget setUpButtonChild() {
    if (widget.vm.mystate == 0) {
      return new Text(
        widget.vm.title,
        style: widget.vm.textS,
      );
    } else if (widget.vm.mystate == 1) {
      this.buttonEnabled=false;              
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(widget.vm.titleC),
      );
    } else {
      this.buttonEnabled=true;
      Timer(Duration(milliseconds: 500), () {
        widget.loaderComplete();
      });
      return Icon(Icons.check, color: Colors.white);
    }
  }
  void animateButton() {
      if(widget.vm.isEnabled){
        widget.onButtonClick();
      }
  }
}

class ButtonLoaderVM{
  String title;
  Color titleC=Colors.black;
  int mystate=0;
  double titleFz;
  Color bgColor = Colors.yellow;
  double bRadius = 100;
  double bHeight=50;
  bool isEnabled=true;
  Color disableC = Colors.grey;
  TextStyle textS=TextStyleUtil.normal(12, Colors.black);

  ButtonLoaderVM(this.title, this.mystate, this.titleFz, bgColor, this.bRadius, this.bHeight);
  ButtonLoaderVM.preDefault(this.title, this.titleFz, this.mystate){
      this.bRadius=100;
      this.textS=TextStyleUtil.normal(titleFz, this.titleC);
  }
  ButtonLoaderVM.alert(this.title, this.titleFz, this.titleC, this.bRadius, this.bHeight, this.bgColor, {this.mystate = 0}){
    this.textS=TextStyleUtil.alertBtn(titleFz, this.titleC);
  }
  ButtonLoaderVM.successMessage(this.title, this.titleFz, this.mystate){
      this.bRadius=11;
      this.textS=TextStyleUtil.normal(titleFz, this.titleC);
  }
  ButtonLoaderVM.editSaveBtn(this.title, this.titleFz, this.mystate){
      this.bRadius=11;
      this.titleC=Colors.white;
      this.textS=TextStyleUtil.normal(titleFz, this.titleC);
      this.bgColor=ColorsService.instance.lightYellow();

  }
  ButtonLoaderVM.toggleButton(this.title, this.titleFz, this.mystate, this.isEnabled, this.disableC){
    this.bRadius=100;
    this.textS=TextStyleUtil.normal(titleFz, this.titleC);
  }
}