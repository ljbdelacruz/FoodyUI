import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foody_ui/services/helper.service.dart';
import 'package:foody_ui/typdef/mytypedef.dart';
import 'package:foody_ui/util/text_style_util.dart';


// ignore: must_be_immutable
class CardWidget extends StatelessWidget {
  final CardWidgetVM vm;
  final String heroTag;
  final NormalCallback direction;
  final NormalCallback click;
  CardWidget(this.direction, this.click, {Key key, this.vm, this.heroTag}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("Tap item");
        click();
      },
      child: Container(
      width: 292,
      margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 20),
      decoration: BoxDecoration(
        color: vm.bgColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.1), blurRadius: 15, offset: Offset(0, 5)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Image of the card
          Stack(
            fit: StackFit.loose,
            alignment: AlignmentDirectional.bottomStart,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  child: CachedNetworkImage(
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: vm.image,
                    placeholder: (context, url) => Image.asset(
                      vm.loaderPlaceholder,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 150,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    decoration: BoxDecoration(color: vm.closed ? Colors.grey : Colors.green, borderRadius: BorderRadius.circular(24)),
                    child: vm.closed
                        ? Text(
                            vm.closedS,
                            style: Theme.of(context).textTheme.caption.merge(TextStyle(color: vm.tsColor))
                          )
                        : Text(
                            vm.openS,
                            style: Theme.of(context).textTheme.caption.merge(TextStyle(color: vm.tsColor)),
                          ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    decoration: BoxDecoration(color: vm.canDelivery? Colors.green : Colors.orange, borderRadius: BorderRadius.circular(24)),
                    child: vm.canDelivery
                        ? Text(
                            vm.deliveryS,
                            style: Theme.of(context).textTheme.caption.merge(TextStyle(color: vm.tsColor)),
                          )
                        : Text(
                            vm.pickupS,
                            style: Theme.of(context).textTheme.caption.merge(TextStyle(color: vm.tsColor)),
                          ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        vm.title,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: TextStyleUtil.wUITextFieldLabel(color:vm.tColor, fontSz:15),
                      ),
                      Text(
                        // Helper.skipHtml(vm.subtitle),
                        vm.subtitle,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: TextStyleUtil.wUITextFieldLabel(color:vm.tColor, fontSz:9),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: HelperService.getStarsList(double.parse(vm.review)),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: direction,
                        child: Icon(Icons.directions, color: vm.tColor),
                        color: vm.buttonColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      ),
                      Text(
                              vm.distance,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              softWrap: false,
                              style:TextStyleUtil.wUITextFieldLabel(color:vm.tColor, fontSz: 14)
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class CardWidgetVM{
  String id;
  bool closed;
  String distance;
  String image;
  String loaderPlaceholder;
  String title;
  String subtitle;
  String review;
  bool delivery;

  Color tsColor;
  String closedS;
  String openS;
  bool canDelivery;
  String deliveryS;
  String pickupS;
  Color tColor;
  Color buttonColor;
  Color bgColor;

  CardWidgetVM(this.id, this.distance, {this.closed=false, this.image="", this.title="", this.subtitle="", this.review="0", this.closedS="Closed", this.openS="Open", this.canDelivery = false, this.deliveryS = "Delivery", this.pickupS = "Pickup", this.tColor = Colors.grey, this.buttonColor = Colors.lightBlue, this.bgColor = Colors.white, this.tsColor = Colors.white, this.loaderPlaceholder="", this.delivery = false});
}
