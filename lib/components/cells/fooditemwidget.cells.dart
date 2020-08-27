import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foody_ui/services/helper.service.dart';
import 'package:foody_ui/typdef/mytypedef.dart';


class FoodsCarouselItemWidget extends StatelessWidget {
  FoodsCarouselItemWidget(this.vm, this.click);
  final FoodsCarouselItemWidgetVM vm;
  final NormalCallback click;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor.withOpacity(0.08),
      highlightColor: Colors.transparent,
      onTap: this.click,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: <Widget>[
              Container(
                  margin: EdgeInsetsDirectional.only(start: vm.margineLeft, end: 20),
                  width: 100,
                  height: 130,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: vm.image,
                      placeholder: (context, url) => Image.asset(
                        'assets/img/loading.gif',
                        fit: BoxFit.cover,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
              ),
              
              Container(
                margin: EdgeInsetsDirectional.only(end: 25, top: 5),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: vm.discountPrice > 0 ? Colors.red : Theme.of(context).accentColor,
                ),
                alignment: AlignmentDirectional.topEnd,
                child: HelperService.getPrice(
                  vm.price,
                  vm.currency,
                  context,
                  style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(color: Theme.of(context).primaryColor)),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
              width: 100,
              margin: EdgeInsetsDirectional.only(start: vm.margineLeft, end: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    vm.name,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    vm.restName,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class FoodsCarouselItemWidgetVM{
  String name;
  String restName;
  double margineLeft;
  double discountPrice;
  double price;
  String currency;
  String image;

  FoodsCarouselItemWidgetVM({this.name="", this.restName="", this.margineLeft = 5, this.discountPrice = 0, this.price = 0, this.image="", this.currency="PHP"});
}
