import 'package:flutter/material.dart';
import 'package:foody_ui/components/buttons/image2.button.dart';


class Design1Header extends StatelessWidget {
  final Design1HeaderCallback callback;
  final Design1HeaderVM vm;
  Design1Header(this.vm, this.callback);
    @override
    Widget build(BuildContext context) {
      return  Container(
              color:vm.bgColor,
              child: Column(children: [
                Row(children: [
                    Flexible(child: Container(), fit: FlexFit.tight, flex: 2),
                    Flexible(fit: FlexFit.tight, flex: 1, child: Image2Buttons(vm.menuLogo, (value){
                      this.callback(1);
                    })),
                ],),
              ]
            ,),
      );
    }
}

class Design1HeaderVM{
  String logo;
  Image2ButtonsVM menuLogo;
  Color bgColor = Colors.white;



  Design1HeaderVM.mydefault(){
    this.menuLogo=Image2ButtonsVM.menudashboard("assets/images/menuwhite.png", 0);
    this.logo="assets/images/home/logowithname.png";
  }
}

typedef Design1HeaderCallback = void Function(int type);