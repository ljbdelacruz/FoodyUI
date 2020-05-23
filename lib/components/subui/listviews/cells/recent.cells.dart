





import 'package:flutter/material.dart';
import 'package:foody_ui/util/string_util.dart';

class RecentCells extends StatelessWidget {
  final RecentCellsVM vm;
  RecentCells(this.vm);

  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<Product>(context, listen: false);
    // final cart = Provider.of<Cart>(context, listen: false);
    return InkWell(
      onTap: () async {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 12,
            ),
            Row(
              children: <Widget>[
                Icon(vm.icon, color: vm.iconC),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(child: Text(vm.detail)),
                      Container(
                        child: Text(vm.btn, style:TextStyle(color:vm.btnC, fontSize:vm.btnFz)),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12,
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
class RecentCellsVM{
  int index;
  IconData icon;
  Color iconC;
  double iconFz;
  String detail;
  double detailFz;
  Color detailC;
  String btn;
  double btnFz;
  Color btnC;
  int limit;
  RecentCellsVM(this.index, this.icon, this.detail, this.btn, this.limit, [this.iconC, this.iconFz, this.detailC, this.detailFz, this.btnC, this.btnFz]){
    this.detail=StringUtil.stringWithHellip(this.detail, limit);
  }

}

