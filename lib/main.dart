import 'package:flutter/material.dart';
import 'package:foody_ui/components/textfields/delivery.textfields.dart';
import 'package:foody_ui/components/textfields/delivery1.textfields.dart';

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
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
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
            Padding(padding:EdgeInsets.only(left:10, top:30, right:10), child: DeliveryTextFields(vm.textField1VM)),
            Padding(padding:EdgeInsets.only(left:10, top:30, right:10), child: DeliveryTextFields1(vm.textField2VM))
          ],
        ),
      ),
    );
  }
}

class HomeControllerSetupVM{
  TextEditingController textField1=TextEditingController();
  DeliveryTextFieldsVM textField1VM;
  DeliveryTextFields1VM textField2VM;
  HomeControllerSetupVM(){
    this.textField1VM=DeliveryTextFieldsVM(this.textField1, "Email", placeholder:"ljdelacruz123@gmail.com");
    this.textField2VM=DeliveryTextFields1VM(this.textField1, "Password", placeholder: "••••••••••••");
  }

}

