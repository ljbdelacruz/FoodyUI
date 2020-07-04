


import 'package:flutter/material.dart';

class StackSliver extends StatelessWidget {
  final StackSliverVM vm;
  StackSliver(this.vm);
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: vm.crossAxisCount),
          delegate: SliverChildListDelegate(
            vm.items,
          ),
    );
  }
}

class StackSliverVM{
  int crossAxisCount=3;
  //allows only sliver
  List<Widget> items = [];
  StackSliverVM(this.items, this.crossAxisCount);
}