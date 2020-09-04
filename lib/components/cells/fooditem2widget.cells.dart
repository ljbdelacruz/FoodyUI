import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foody_ui/services/color.service.dart';
import 'package:foody_ui/typdef/mytypedef.dart';



class FoodItem2WidgetVM{
  String heroTag;
  FoodItem2WidgetProduct item;
  FoodItem2WidgetVM({this.heroTag="", this.item});
}
class FoodItem2WidgetProduct{
  String id;
  String image;
  String name;
  double review;
  String subdesc;
  double price;
  FoodItem2WidgetProduct({this.id="1ee",this.image="", this.name="", this.review=0.0, this.subdesc="", this.price=0.0});
}


class FoodItem2Widget extends StatelessWidget {
  final FoodItem2WidgetVM vm;
  final NormalCallback click;

  const FoodItem2Widget(this.vm, {this.click});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      focusColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).primaryColor,
      onTap: () {
        if(this.click != null){
          this.click();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: ColorsService.instance.lightGrey(),
          boxShadow: [
            BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.1), blurRadius: 5, offset: Offset(0, 2)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: vm.heroTag,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: CachedNetworkImage(
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                  imageUrl: vm.item.image,
                  // placeholder: (context, url) => Image.asset(
                  //   'assets/img/loading.gif',
                  //   fit: BoxFit.cover,
                  //   height: 60,
                  //   width: 60,
                  // ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
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
                          vm.item.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Row(
                          children: [Text(vm.item.review.toString())],
                        ),
                        Text(
                          vm.item.subdesc,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(vm.item.price.toString())
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
