






import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/typdef/mytypedef.dart';
import 'package:foody_ui/util/string_util.dart';
import 'package:foody_ui/util/text_style_util.dart';

class ItemCells extends StatelessWidget {
  final NormalCallback onClick;
  final ItemCellsVM vm;
  ItemCells(this.vm, this.onClick);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      child: Card(
        color:vm.bgColor,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 0.0,
        child: InkWell(
          onTap: () async {

          },
          child: Row(
            children: <Widget>[
              CachedNetworkImage(
                fit: BoxFit.cover,
                height: 96,
                width: 96,
                imageUrl: vm.imageUrl,
              ),
              Container(
                width: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    vm.name,
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: vm.starColor,
                        size: 16,
                      ),
                      Container(
                        width: 5,
                      ),
                      Text(
                        //3.0(5 Reviews)
                        vm.rating,
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        //status AVAILABLE or UNAVAILABLE
                        vm.status,
                        style: vm.isAvailable ? TextStyleUtil.itemCellAvailable : TextStyleUtil.itemCellUnavailable,
                      ),
                      Text(
                        "  ●  ",
                      ),
                      Text(
                        vm.distance,
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCellsVM{
  Color bgColor;
  Color starColor=Colors.yellow;
  String imageUrl;
  String name;
  String rating;
  String status;
  bool isAvailable;
  String distance;
  int limit;
  ItemCellsVM(this.bgColor,this.starColor, this.imageUrl, this.name, this.rating, this.status, this.isAvailable, this.distance, this.limit){
    this.name=StringUtil.stringWithHellip(this.name, limit);
  }
}