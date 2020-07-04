import 'package:flutter/material.dart';

class Tabbed1Header extends StatelessWidget {
  final Tabbed1HeaderVM vm;
  Tabbed1Header(this.vm);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            vm.title,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelColor: Colors.black,
                isScrollable: true,
                tabs: vm.tabs,
              ),
            ),
          ),
        );

  }
}
class Tabbed1HeaderVM{
  String title;
  List<Tab> tabs = [];
  Tabbed1HeaderVM(this.title, this.tabs);
}

