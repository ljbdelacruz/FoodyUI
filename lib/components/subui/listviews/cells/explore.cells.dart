


import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/util/string_util.dart';

class ExploreMenuCell extends StatelessWidget {
  final ExploreMenuCellVM vm;
  ExploreMenuCell(this.vm);
  @override
  Widget build(BuildContext context) {
    return Container(height: vm.height, width:vm.width,
    //  color:Colors.black,
     child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  CachedNetworkImage(
                                    imageUrl: vm.image,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      height: vm.height,
                                      width: vm.width,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) {
                                      return Container(
                                          child: Center(
                                        child: CircularProgressIndicator(),
                                      ));
                                    },
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) =>
                                        new Icon(Icons.error),
                                  ),
                                  Positioned(
                                    right: 7,
                                    top: 7,
                                    child: IconButton(
                                      onPressed: () {
                                        //TODO Remove to Favorite function
                                      },
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                '${vm.distance}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45,
                                ),
                              ),
                              Text(
                                '${vm.title}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange[400],
                                    size: 18,
                                  ),
                                  Text(
                                    '${vm.rating}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ));
  }
}

class ExploreMenuCellVM{
  String image;
  String distance;
  String title;
  String rating;
  int limit=10;
  double width;
  double height;
  ExploreMenuCellVM(this.image, this.distance, this.title, this.rating, this.limit, this.width, this.height){
    this.title=StringUtil.stringWithHellip(this.title, limit);
  }
}