

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/typdef/mytypedef.dart';

class OptionCells extends StatelessWidget {
  final NormalCallback click;
  final OptionCellsVM vm;
  OptionCells(this.vm, this.click);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 5.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: RawMaterialButton(
                          onPressed: () {},
                          elevation: 0.0,
                          shape: new CircleBorder(),
                          fillColor: Color.fromRGBO(244, 245, 248, 1),
                          child: Icon(
                            vm.icon,
                            color: vm.iconColor,
                            size: 16.0,
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 12),
                          child: Text(
                            vm.label,
                            style: TextStyle(fontSize: 12.0),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(vm.notifNumber),
                      Icon(Icons.chevron_right),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Divider(
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}

class OptionCellsVM{
  String notifNumber;
  String label;
  Color iconColor = Colors.blue;
  IconData icon;
  OptionCellsVM(this.notifNumber, this.label, this.icon, [this.iconColor]);
}






    