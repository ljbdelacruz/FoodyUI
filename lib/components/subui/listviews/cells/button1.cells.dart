
import 'package:flutter/material.dart';


class Button1Cells extends StatelessWidget {
  final Button1CellsVM vm;
  Button1Cells(this.vm);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        //clicked
      },
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
                            color: vm.iconC,
                            size: 16.0,
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 12),
                          child: Text(
                            vm.title,
                            style: TextStyle(fontSize: 12.0),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(vm.count),
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
class Button1CellsVM{
  IconData icon;
  Color iconC;
  String title;
  Color titleC;
  double titleFz;
  String count;
  Color countC;
  double countFz;
  Button1CellsVM(this.icon, this.title, this.count, [this.iconC, this.titleC, this.titleFz, this.countFz, this.countC]);
}

