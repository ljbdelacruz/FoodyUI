import 'package:flutter/material.dart';

class CustomScrollSlivers extends StatelessWidget {
  final CustomScrollSliversVM vm;
  CustomScrollSlivers(this.vm);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: vm.scrollDirection,
      slivers: vm.items,
    );
  }
}

class CustomScrollSliversVM{
  Axis scrollDirection=Axis.horizontal;
  //allows only sliver
  List<Widget> items = [];
  CustomScrollSliversVM(this.items, [this.scrollDirection]);
}