import 'package:flutter/material.dart';
import 'package:foody_ui/apptheme/delivery.theme.dart';
import 'package:foody_ui/apptheme/ljui.theme.dart';
import 'package:foody_ui/apptheme/walletui.theme.dart';
import 'package:foody_ui/components/sidemenu/fui1.sidemenu.dart';
import 'package:foody_ui/components/textfields/delivery.textfields.dart';
import 'package:foody_ui/components/textfields/delivery1.textfields.dart';
import 'package:foody_ui/pages/wUITab.page.dart';

import 'components/subui/footer/fuifooter.subui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: ''),
      // home:WUITabPage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  HomeControllerSetupVM vm = HomeControllerSetupVM();
  TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      endDrawer: FUI1Sidemenu(FUI1SidemenuVM.temp(option1Header:"Test header 1"), (){}),
      body: SingleChildScrollView(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height:30),
            text(),
            radioButtons(),
            textFields(),
            tableViewCells(),
            cards(),
            incrementorUI(),
            SizedBox(height:100),
          ],
        ),
      )),
      bottomNavigationBar: FuiFooterSubUI.instance.footer1(vm.tab, (tab){
        print(tab);
        print("Selected Tab");
        setState(() {
          vm.tab = tab;
        });
      }, [FUIFooterItems.temp(icon: Icons.shopping_cart), FUIFooterItems.temp(icon:Icons.map), FUIFooterItems.temp1(icon:Icons.add), FUIFooterItems.temp(icon:Icons.local_activity), FUIFooterItems.temp(icon:Icons.settings)]),
    );
  }

  Widget text(){
    return Column(children:[
      WalletUITheme.instance.text((){})
    ]);
  }
  Widget radioButtons(){
    return Container(child:Column(children:[
      WalletUITheme.instance.walletUIButtons(context, vm.toggle, toggle)
    ]));
  }
  Widget textFields(){
    return Container(child:Column(children:[
      WalletUITheme.instance.walletUITextFields(context),
      DeliveryUITheme.instance.deliveryUITextFields(context, vm.textField1),
      // LJThemeUI.instance.textFields()
    ]));
  }
  Widget tableViewCells(){
    return Container(child:Column(children:[
      WalletUITheme.instance.tableViewCells(context,vm.toggle, toggle),
      DeliveryUITheme.instance.tableViewCells(context)
    ]));
  }
  Widget cards(){
    return Container(child:Column(children:[
      WalletUITheme.instance.cards()
    ]));
  }
  Widget incrementorUI(){
    return Container(child:Column(children:[
      DeliveryUITheme.instance.incrementor((){
        //TODO: inc
        setState((){
          vm.count++;
        });
      }, (){
        //TODO: dec
        if(vm.count > 0){
          setState((){
            vm.count--;
          });
        }
      }, vm.count.toString())
    ]));
  }

  toggle(){
        setState((){
          vm.toggle = !vm.toggle;
        });
  }
}

class HomeControllerSetupVM{
  TextEditingController textField1=TextEditingController();
  bool toggle = false;
  HomeControllerSetupVM();
  int count = 0;
  int tab = 0;

}

