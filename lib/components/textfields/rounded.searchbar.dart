import 'package:flutter/material.dart';
import 'package:foody_ui/typdef/mytypedef.dart';
import 'package:foody_ui/util/search_style_util.dart';

class RoundedSearchBar extends StatelessWidget {
  final NormalCallback onTap;
  final NormalCallback onChange;
  final RoundedSearchBarVM vm;
  RoundedSearchBar(this.vm, this.onTap, this.onChange);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: vm.height,
      // margin: EdgeInsets.only(right: 15.0),
      child: TextFormField(
        onChanged: (text){
          //TODO: Invoke on change text
          this.onChange();
        },
        controller: vm.controller,
        onTap: () {
          onTap();
        },
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          hintText: vm.hintText,
          border: SearchStyle.searchBorder,
          focusedBorder: SearchStyle.searchFocusedBorder,
        ),
      ),
    );
  }
}

class RoundedSearchBarVM{
  String hintText;
  double height=54;
  TextEditingController controller;


  RoundedSearchBarVM(this.hintText, this.height, this.controller);
}
