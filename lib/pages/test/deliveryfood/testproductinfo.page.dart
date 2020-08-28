


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/config/constants.instance.dart';
import 'package:foody_ui/pages/deliveryfood/dfproductinfo.page.dart';

class TestProductInfoPage extends StatefulWidget{
  TestProductInfoPage();
  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}
class _UserLoginPageState extends State<TestProductInfoPage> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  TestProductInfoPageVM vm = TestProductInfoPageVM();
  @override
  Widget build(Object context) {
    // TODO: implement build
    return DFProductInfoPage(DFProductInfoPageVM(refreshEvent:(){}, scaffoldKey:scaffoldKey, product:vm.product, heroTag:"test1", incrementEvent: (){
      //TODO: increment event
      vm.product.quantity++;
      this.setState(() { });
    }, decrementEvent: (){
      this.setState(() { });
      vm.product.quantity--;
      this.setState(() { });
      //TODO: decrement event
    }, addToCartEvent: (){
      //TODO: add to cart
    }));
  }
}


class TestProductInfoPageVM{
  DFProductInfoPageItem product;
  TestProductInfoPageVM(){
    this.product = DFProductInfoPageItem(name:"Tester", image: Constants.instance.defaultImage, storeName:"Store of dragons", price:23, description:"hallo", subtotal: 23, quantity:1);
  }
}