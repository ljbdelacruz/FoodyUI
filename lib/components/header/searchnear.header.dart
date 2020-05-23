
import 'package:flutter/material.dart';
import 'package:foody_ui/typdef/mytypedef.dart';
import 'package:foody_ui/util/outlined_style_util.dart';
import 'package:foody_ui/util/string_util.dart';


class SearchNearHeader extends StatelessWidget {
  final GetIntData btnClick;
  final SearchNearHeaderVM vm;
  SearchNearHeader(this.vm, this.btnClick);
    @override
    Widget build(BuildContext context) {
      return Container(
                height:54,
                color: Colors.grey,
                child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      OutlineButton(
                      borderSide: OutlinedStyle.transparentBorder,
                      onPressed: (){
                        this.btnClick(0);
                      },
                      child:Row(children: [
                        Icon(
                          vm.icon,
                          color: vm.iconC,
                          size: vm.iconFz,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          vm.text1,
                          style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: vm.text1Fz,
                              color: vm.text1C),
                        ),
                        Text(
                          vm.text2,
                          style: TextStyle(
                              color:vm.text2C,
                              fontWeight: FontWeight.normal, fontSize: vm.text2Fz),
                        ),
                      ],)),
                      OutlineButton(
                        borderSide: OutlinedStyle.transparentBorder,
                        onPressed: (){
                          btnClick(1);
                        },
                        child:Text(vm.btnLbl,
                        style:TextStyle(color: vm.btnLblC, fontSize: vm.btnLblFz)),
                      )
                    ],
                    
              )]
      ));

    }
}

class SearchNearHeaderVM{
  IconData icon;
  double iconFz=15;
  Color iconC=Colors.blue;
  String text1;
  double text1Fz=12;
  Color text1C=Colors.white;
  String text2;
  double text2Fz=12;
  Color text2C=Colors.black;
  String btnLbl;
  double btnLblFz=12;
  Color btnLblC=Colors.blue;
  SearchNearHeaderVM(this.icon, this.text1, this.text2, this.btnLbl, [this.iconFz, this.iconC, this.text1Fz, this.text2Fz, this.text1C, this.text2C, this.btnLblFz, this.btnLblC]){
    this.text1=StringUtil.stringWithHellip(text1, 30);
    this.text2=StringUtil.stringWithHellip(text2, 10);
  }
}