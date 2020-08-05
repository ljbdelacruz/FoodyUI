import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foody_ui/typdef/mytypedef.dart';

// ignore: must_be_immutable
// class CartItemWidget extends StatefulWidget {
//   String heroTag;
//   Cart cart;
//   VoidCallback increment;
//   VoidCallback decrement;
//   VoidCallback onDismissed;

//   CartItemWidget({Key key, this.cart, this.heroTag, this.increment, this.decrement, this.onDismissed}) : super(key: key);

//   @override
//   _CartItemWidgetState createState() => _CartItemWidgetState();
// }

class CardItem2Widget extends StatelessWidget {
  final CardItem2WidgetVM vm;
  final NormalCallback dismiss;
  final NormalCallback click;
  final NormalCallback incrementEvent;
  final NormalCallback decrementEvent;
  CardItem2Widget(this.vm, this.dismiss, this.click, this.incrementEvent, this.decrementEvent);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(vm.id),
      onDismissed: (direction) {
        dismiss();
      },
      child: InkWell(
        splashColor: Theme.of(context).accentColor,
        focusColor: Theme.of(context).accentColor,
        highlightColor: Theme.of(context).primaryColor,
        onTap: click,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: vm.bgColor.withOpacity(0.9),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.1), blurRadius: 5, offset: Offset(0, 2)),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: CachedNetworkImage(
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                  imageUrl: vm.image,
                  placeholder: (context, url) => Image.asset(
                    vm.loadingGif,
                    fit: BoxFit.cover,
                    height: 90,
                    width: 90,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(width: 15),
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            vm.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          // Wrap(
                          //   children: List.generate(widget.cart.extras.length, (index) {
                          //     return Text(
                          //       widget.cart.extras.elementAt(index).name + ', ',
                          //       style: Theme.of(context).textTheme.caption,
                          //     );
                          //   }),
                          // ),
                          // Helper.getPrice(widget.cart.food.price, context, style: Theme.of(context).textTheme.headline4)
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            this.incrementEvent();
                            // setState(() {
                            //   widget.increment();
                            // });
                          },
                          iconSize: 30,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          icon: Icon(Icons.add_circle_outline),
                          color: Theme.of(context).hintColor,
                        ),
                        Text(vm.quantity.toString(), style: Theme.of(context).textTheme.subtitle1),
                        IconButton(
                          onPressed: () {
                            this.decrementEvent();
                            // setState(() {
                            //   widget.decrement();
                            // });
                          },
                          iconSize: 30,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          icon: Icon(Icons.remove_circle_outline),
                          color: Theme.of(context).hintColor,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class CardItem2WidgetVM{
  String id;
  String image;
  int quantity = 0;
  String name;
  String tag;
  Color bgColor;
  String loadingGif;
  CardItem2WidgetVM(this.tag, this.id, {this.image = "", this.quantity = 1, this.name="", this.bgColor = Colors.blue, this.loadingGif = ""});

}
