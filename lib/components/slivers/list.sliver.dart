


import 'package:flutter/material.dart';

class ListSliver extends StatelessWidget {
  final ListSliverVM vm;
  ListSliver(this.vm);
  @override
  Widget build(BuildContext context) {
    return SliverList(
          delegate: SliverChildListDelegate(
            vm.items,
          ),
    );
  }
}

class ListSliverVM{
  //allows only sliver
  List<Widget> items = [];
  ListSliverVM(this.items);
}