


import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/util/string_util.dart';
import '../../../../typdef/mytypedef.dart';

class StoreMenuCells extends StatefulWidget {
  final StoreMenuCellsVM vm;
  final NormalCallback click;
  StoreMenuCells(this.vm, this.click);
  @override
  StoreMenuCellsState createState() => StoreMenuCellsState();
}
class StoreMenuCellsState extends State<StoreMenuCells> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: widget.click, child:Container(height: widget.vm.height, width:MediaQuery.of(context).size.width,
       child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  CachedNetworkImage(
                                    imageUrl: widget.vm.image,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      height: widget.vm.height,
                                      width: MediaQuery.of(context).size.width,
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
                                        setState(() {
                                          widget.vm.isFav=!widget.vm.isFav;
                                          widget.vm.favIcon=widget.vm.isFav ? Icons.favorite : Icons.favorite_border;
                                        });
                                      },
                                      icon: Icon(
                                        widget.vm.favIcon,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                '${widget.vm.distance}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45,
                                ),
                              ),
                              Text(
                                '${widget.vm.title}',
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
                                    '${widget.vm.rating}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )));
  }
}

class StoreMenuCellsVM{
  IconData favIcon=Icons.favorite_border;
  bool isFav=false;
  String image;
  String distance;
  String title;
  String rating;
  int limit=10;
  double width;
  double height;
  StoreMenuCellsVM(this.image, this.distance, this.title, this.rating, this.limit, this.width, this.height){
    this.title=StringUtil.stringWithHellip(this.title, limit);
    favIcon=isFav ? Icons.favorite : Icons.favorite_border;
  }
}