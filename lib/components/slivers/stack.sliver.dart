


import 'package:flutter/material.dart';

class StackSliver extends StatelessWidget {
  final StackSliverVM vm;
  StackSliver(this.vm);
  @override
  Widget build(BuildContext context) {
    double itemWidth=MediaQuery.of(context).size.width / vm.width;
    double itemHeight = MediaQuery.of(context).size.height / vm.height;
    return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: vm.crossAxisCount, childAspectRatio: itemWidth / itemHeight),
          delegate: SliverChildListDelegate(
            vm.items,
          ),
    );
  }
}

class StackSliverVM{
  int crossAxisCount=3;
  double width=1.3;
  double height=2;
  //allows only sliver
  List<Widget> items = [];
  StackSliverVM(this.items, this.crossAxisCount, {this.width=1.3, this.height=2});
}