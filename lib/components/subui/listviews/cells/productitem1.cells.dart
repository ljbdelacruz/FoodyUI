


import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../typdef/mytypedef.dart';

class ProductItem1Cells extends StatefulWidget {
  final ProductItem1CellsVM vm;
  final NormalCallback click;
  ProductItem1Cells(this.vm, this.click);
  @override
  ProductItem1CellsState createState() => ProductItem1CellsState();
}
class ProductItem1CellsState extends State<ProductItem1Cells> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: widget.click, child:Container(height: widget.vm.height, width:MediaQuery.of(context).size.width,
       child: Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      child: Card(
        color:widget.vm.bgColor,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 0.0,
        child: InkWell(
          onTap: widget.click,
          child: Row(
            children: <Widget>[
              CachedNetworkImage(
                fit: BoxFit.cover,
                height: widget.vm.height,
                width: 96,
                imageUrl: widget.vm.image,
              ),
              Container(
                width: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.vm.title,
                    style: widget.vm.titleStyle,
                  ),
                  Padding(padding: EdgeInsets.only(bottom:5), child:Text(widget.vm.currency+" "+widget.vm.price.toString(), style:widget.vm.priceStyle)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: widget.vm.starColor,
                        size: 16,
                      ),
                      Container(
                        width: 5,
                      ),
                      Text(
                        //3.0(5 Reviews)
                        widget.vm.rating.toString(),
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    )
  ));
  }
}

class ProductItem1CellsVM{
  String image;
  String title;
  TextStyle titleStyle;

  double rating;
  double price;
  TextStyle priceStyle;

  String currency;
  double width;
  double height;
  Color starColor=Colors.yellow;
  Color bgColor = Colors.white;

  ProductItem1CellsVM(this.image, this.title, this.titleStyle, this.rating, this.price, this.priceStyle, this.currency, this.width, this.height);
}