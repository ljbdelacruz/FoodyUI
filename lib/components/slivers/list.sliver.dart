


import 'package:flutter/material.dart';

class ListSliver extends StatelessWidget {
  final ListSliverVM vm;
  ListSliver(this.vm);
  @override
  Widget build(BuildContext context) {
    return SliverList(
          delegate: SliverChildListDelegate(
            [
              ...vm.items.map((view)=>view)
            ],
          ),
    );
  }
}

class ListSliverVM{
  //allows only sliver
  List<Widget> items = [];
  ListSliverVM(this.items);
}