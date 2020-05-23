import 'package:flutter/material.dart';
import 'package:foody_ui/components/subui/listviews/collectionlist.subui.dart';
import 'package:foody_ui/typdef/mytypedef.dart';

class DashboardFooter extends StatelessWidget {
  final GetIntData callback;
  final DashboardFooterVM vm;
  DashboardFooter(this.vm, this.callback);
    @override
    Widget build(BuildContext context) {
      return Container(height:80, 
      child: CollectionListSubUI(vm.collectionVM, callback)
      );
    }
}

class DashboardFooterVM{
  CollectionListSubUIVM collectionVM; 
  Color bgColor=Colors.white;
  DashboardFooterVM(){
    this.collectionVM=CollectionListSubUIVM(4,4);
  }
  DashboardFooterVM.foodyDashboard(){
    this.collectionVM=CollectionListSubUIVM.footer(5,5,5);
    this.collectionVM.appendItems(0, "Home", "assets/images/home.png");
    this.collectionVM.appendItems(4, "Activity", "assets/images/plus.png");
    this.collectionVM.appendItems(1, "Payment Method", "assets/images/wallet.png");
    this.collectionVM.appendItems(2, "Inbox", "assets/images/chat.png");
    this.collectionVM.appendItems(3, "Notification", "assets/images/notification.png");
  }
}