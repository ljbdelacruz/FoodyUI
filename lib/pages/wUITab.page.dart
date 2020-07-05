





import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/apptheme/walletui.theme.dart';
import 'package:foody_ui/subui/tabs.subui.dart';

class WUITabPage extends StatefulWidget {
  
  WUITabPage();
  @override
  WUITabPageState createState() => WUITabPageState();
}

class WUITabPageState extends State<WUITabPage> with SingleTickerProviderStateMixin {
  TabController _controller;
  WUITabPageVM vm = WUITabPageVM();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(child:Scaffold(appBar:PreferredSize(child: header(), preferredSize: Size.fromHeight(50)),
                    body:TabBarView(
                      controller: _controller,
                      children:[
                      buttons(),
                      Container()
                    ])
    ));
  }
  Widget header({Color usColor = Colors.grey, Color lblColor = Colors.grey, indiColor = Colors.white}){
    return TabsSubUI.instance.wUITabs(["Buttons", "TextFields"], _controller, lblColor:Colors.black, usColor: Colors.black, indiColor: Colors.black);
  }
  Widget avatar(){
    return Container(child:Column(children:[
    ]));
  }
  Widget buttons(){
    return Container(
      padding:EdgeInsets.only(top:50),
      child:Column(children:[
      WalletUITheme.instance.walletUIButtons(context, vm.value, toggle),
      WalletUITheme.instance.avatars()
    ]));
  }
  toggle(){
    setState((){
      vm.value = !vm.value;
    });
  }
}
class WUITabPageVM{
  bool value = false;
}