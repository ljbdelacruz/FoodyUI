import 'package:flutter/material.dart';

class Tabbed2Header extends StatelessWidget {
  final Tabbed2HeaderVM vm;
  Tabbed2Header(this.vm);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(400),
            child:Column(children: [
              vm.header,
              Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelColor: Colors.black,
                isScrollable: true,
                tabs: vm.tabs,
              ),
            ),
            ]) 
          ),
        );

  }
}
class Tabbed2HeaderVM{
  Widget header;
  List<Tab> tabs = [];
  Tabbed2HeaderVM(this.header, this.tabs);
}

