import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foody_ui/typdef/mytypedef.dart';

class Searchbar1TextFields extends StatelessWidget {
  
  final Searchbar1TextFieldsVM vm;
  final NormalCallback filterEvent;


  Searchbar1TextFields(this.vm, this.filterEvent);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Theme.of(context).focusColor.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 12, left: 0),
              child: Icon(Icons.search, color: Theme.of(context).accentColor),
            ),
            Expanded(
              child: Text(
                vm.label,
                maxLines: 1,
                style: Theme.of(context).textTheme.caption.merge(TextStyle(fontSize: 14)),
              ),
            ),
            InkWell(
              onTap: this.filterEvent,
              child: Padding(
                padding: const EdgeInsets.only(right: 5, left: 5, top: 3, bottom: 3),
                child: Icon(Icons.filter_list, color: Theme.of(context).accentColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Searchbar1TextFieldsVM{
  String label;
  Searchbar1TextFieldsVM({this.label=""});

}