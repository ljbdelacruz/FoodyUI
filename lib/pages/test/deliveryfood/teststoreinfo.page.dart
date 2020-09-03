


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/components/cells/fooditem2widget.cells.dart';
import 'package:foody_ui/components/list/reviewlist1.widget.dart';
import 'package:foody_ui/config/constants.instance.dart';
import 'package:foody_ui/pages/deliveryfood/dfstoreinfo.page.dart';

class TestStoreInfoPage extends StatefulWidget{
  TestStoreInfoPage();
  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}
class _UserLoginPageState extends State<TestStoreInfoPage> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  TestProductInfoPageVM vm = TestProductInfoPageVM();

  @override
  Widget build(Object context) {
    // TODO: implement build
    return DFStoreInfoPage(vm.vm);
  }
}


class TestProductInfoPageVM{
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  DFStoreInfoPageVM vm;
  TestProductInfoPageVM(){
    var product = DFStoreInfoPageDetails(id:"1ee", mainImage: Constants.instance.defaultImage, title:"Tester store", distance:"2 km", isOpen:false, description: "Tester store description here please", operatingHours: "Weekdays 9:00 - 6PM", locationAddress: "Cypress Tower Celesta Taguig", review:4.0, mobileNumber: "09493169481", telePhone:"8700");
    product.carouselImages = [Constants.instance.defaultImage, Constants.instance.defaultImage];
    product.productItems = [
      FoodItem2WidgetProduct(id:"1ee",image:Constants.instance.defaultImage, name:"test prod 1", review:4.0, subdesc: "subdesc test1", price:40.0),
      FoodItem2WidgetProduct(id:"2ee",image:Constants.instance.defaultImage, name:"test prod 2", review:4.0, subdesc: "subdesc test2", price:40.0),
    ];
    product.productReviews = [
      ReviewsListWidgetItem(id:"1ee", name:"tester review 1", title:"review title", desc:"test description of review here", image:Constants.instance.defaultImage, review:4.0),
      ReviewsListWidgetItem(id:"2ee", name:"tester review 2", title:"review title", desc:"test description of review here", image:Constants.instance.defaultImage, review:4.0)
    ];

    this.vm=DFStoreInfoPageVM(scaffoldKey: scaffoldKey, productDetails: product, heroTag:"tester05");
  }
}