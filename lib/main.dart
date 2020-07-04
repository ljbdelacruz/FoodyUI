import 'package:flutter/material.dart';
import 'package:foody_ui/apptheme/delivery.theme.dart';
import 'package:foody_ui/apptheme/walletui.theme.dart';
import 'package:foody_ui/components/textfields/delivery.textfields.dart';
import 'package:foody_ui/components/textfields/delivery1.textfields.dart';
import 'package:foody_ui/services/color.service.dart';
import 'package:foody_ui/subui/textfields.subui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  HomeControllerSetupVM vm = HomeControllerSetupVM();
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            radioButtons(),
            textFields()
          ],
        ),
      ),
    );
  }

  Widget radioButtons(){
    return Container(child:Column(children:[
      WalletUITheme.instance.walletUIButtons(context, vm.toggle, (){
        setState((){
          vm.toggle = !vm.toggle;
        });
      })
    ]));
  }
  Widget textFields(){
    return Container(child:Column(children:[
      DeliveryUITheme.instance.deliveryUITextFields(context, vm.textField1)
    ]));
  }

  Widget deliveryUITextFields(){
    return Container(
      width:MediaQuery.of(context).size.width-100,
      height:MediaQuery.of(context).size.height-96,
      // color:Colors.black,
      child:Column(children:[
        SizedBox(height:30),
        TextFieldSubUI.instance.dfUITextField1(vm.textField1, "Email or Username", iColor:Colors.grey, tColor:Colors.grey, bColor:ColorsService.instance.primaryColor()),
        SizedBox(height:30),
        TextFieldSubUI.instance.dfUITextfield1Pass(vm.textField1, "Password", placeholder:"****************", iColor:Colors.grey, tColor:Colors.grey, bColor:ColorsService.instance.primaryColor())
    ]));
  }

}

class HomeControllerSetupVM{
  TextEditingController textField1=TextEditingController();
  DeliveryTextFieldsVM textField1VM;
  DeliveryTextFields1VM textField2VM;
  bool toggle = false;
  HomeControllerSetupVM(){
    this.textField1VM=DeliveryTextFieldsVM(this.textField1, "Email", placeholder:"ljdelacruz123@gmail.com");
    this.textField2VM=DeliveryTextFields1VM(this.textField1, "Password", placeholder: "••••••••••••");
  }



}

