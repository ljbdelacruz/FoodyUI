import 'package:flutter/material.dart';
import 'package:foody_ui/typdef/mytypedef.dart';


class ShoppingCartButtonWidget extends StatelessWidget {
  final ShoppingCartButtonWidgetVM vm; 
  final NormalCallback click;
  ShoppingCartButtonWidget(this.vm, this.click);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
      onPressed: click,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: <Widget>[
          Icon(
            Icons.shopping_cart,
            color: vm.iColor,
            size: 28,
          ),
          Container(
            child: Text(
              vm.cartCount.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption.merge(
                    TextStyle(color: Theme.of(context).primaryColor, fontSize: 9),
                  ),
            ),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(color: vm.lColor, borderRadius: BorderRadius.all(Radius.circular(10))),
            constraints: BoxConstraints(minWidth: 15, maxWidth: 15, minHeight: 15, maxHeight: 15),
          ),
        ],
      ),
      color: Colors.transparent,
    );
  }


}

class ShoppingCartButtonWidgetVM{
  Color iColor = Colors.white;
  Color lColor = Colors.blue;
  int cartCount = 0;
  ShoppingCartButtonWidgetVM({this.cartCount = 0});
}
