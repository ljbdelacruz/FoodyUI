
import 'package:flutter/material.dart';
import 'package:foody_ui/typdef/mytypedef.dart';
import 'package:foody_ui/util/outlined_style_util.dart';
import 'package:foody_ui/util/string_util.dart';


class ViewAllHeader extends StatelessWidget {
  final NormalCallback btnClick;
  final ViewAllHeaderVM vm;
  ViewAllHeader(this.vm, this.btnClick);
    @override
    Widget build(BuildContext context) {
      return  Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        vm.title,
                        style: TextStyle(
                          color: vm.titleC,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      OutlineButton(onPressed: (){
                        this.btnClick();
                      },borderSide: OutlinedStyle.transparentBorder, child:Text(
                        vm.btnLbl,
                        style: TextStyle(
                            color: vm.btnLblC,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),),
                    ],
                  ),
      );

    }
}

class ViewAllHeaderVM{
  String title;
  double titleFz=20;
  Color titleC=Colors.black;
  String btnLbl;
  double btnLblFz=14;
  int limit;
  Color btnLblC=Colors.black;
  ViewAllHeaderVM(this.title, this.btnLbl, this.limit, [this.btnLblFz, this.titleFz, this.btnLblC, this.titleC]){
    this.title=StringUtil.stringWithHellip(this.title, limit);
  }
}