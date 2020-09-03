


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/components/progress/circularloading.progress.dart';
import 'package:foody_ui/typdef/mytypedef.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foody_ui/util/text_style_util.dart';

class DFProductInfoPageVM{
  NormalCallback refreshEvent;
  NormalCallback decrementEvent;
  NormalCallback incrementEvent;
  NormalCallback addToCartEvent;
  GlobalKey<ScaffoldState> scaffoldKey;
  DFProductInfoPageItem product;
  String heroTag;
  DFProductInfoPageVM({this.refreshEvent, this.scaffoldKey, this.product, this.heroTag, this.decrementEvent, this.incrementEvent, this.addToCartEvent});
  updateSubtotal(){
    this.product.subtotal = this.product.quantity.toDouble() * product.price;
  }
}

class DFProductInfoPageItem{
  String name;
  String storeName;
  String image;
  double price;
  String description;
  int quantity = 1;
  double subtotal = 0;
  DFProductInfoPageItem({this.name="", this.image="", this.storeName="", this.price=0.0, this.description="", this.subtotal=0.0, this.quantity=1});
}


class DFProductInfoPage extends StatelessWidget {

  final DFProductInfoPageVM vm;
  DFProductInfoPage(this.vm);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: vm.scaffoldKey,
      body: vm.product == null || vm.product?.image == null
          ? CircularLoadingWidget(height: 500)
          : RefreshIndicator(
              onRefresh: vm.refreshEvent,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 125),
                    padding: EdgeInsets.only(bottom: 15),
                    child: CustomScrollView(
                      primary: true,
                      shrinkWrap: false,
                      slivers: <Widget>[
                        SliverAppBar(
                          // automaticallyImplyLeading: false,
                          backgroundColor: Theme.of(context).accentColor.withOpacity(0.9),
                          expandedHeight: 300,
                          elevation: 0,
                          iconTheme: IconThemeData(color: Colors.red),
                          flexibleSpace: FlexibleSpaceBar(
                            collapseMode: CollapseMode.parallax,
                            background: Hero(
                              tag: vm.heroTag,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: vm.product.image,
                                // placeholder: (context, url) => Image.asset(
                                //   'assets/img/loading.gif',
                                //   fit: BoxFit.cover,
                                // ),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            child: Wrap(
                              runSpacing: 8,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width:MediaQuery.of(context).size.width/1.4,
                                            child:
                                          Text(
                                            vm.product.name ?? '',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyleUtil.textNormal(fontSz:20, tColor:Colors.grey),
                                          )),
                                          Text(
                                            vm.product.storeName ?? '',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyleUtil.textNormal(fontSz:15, tColor:Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(vm.product.price.toString(), style:TextStyleUtil.textBold(fontSz:20, tColor:Colors.red))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    // Container(
                                    //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                                    //   decoration: BoxDecoration(
                                    //       color: Helper.canDelivery(_con.food.restaurant) && _con.food.deliverable ? Colors.green : Colors.orange,
                                    //       borderRadius: BorderRadius.circular(24)),
                                    //   child: Helper.canDelivery(_con.food.restaurant) && _con.food.deliverable
                                    //       ? Text(
                                    //           S.of(context).deliverable,
                                    //           style: Theme.of(context).textTheme.caption.merge(TextStyle(color: Theme.of(context).primaryColor)),
                                    //         )
                                    //       : Text(
                                    //           S.of(context).not_deliverable,
                                    //           style: Theme.of(context).textTheme.caption.merge(TextStyle(color: Theme.of(context).primaryColor)),
                                    //         ),
                                    // ),
                                    Expanded(child: SizedBox(height: 0)),
                                  ],
                                ),
                                Divider(height: 20),
                                Text(vm.product.description),
                                SizedBox(height: 800,)
                                // ListTile(
                                //   dense: true,
                                //   contentPadding: EdgeInsets.symmetric(vertical: 10),
                                //   leading: Icon(
                                //     Icons.add_circle,
                                //     color: Theme.of(context).hintColor,
                                //   ),
                                //   title: Text(
                                //     S.of(context).extras,
                                //     style: Theme.of(context).textTheme.subtitle1,
                                //   ),
                                //   subtitle: Text(
                                //     "Select Extas to add them on food",
                                //     style: Theme.of(context).textTheme.caption,
                                //   ),
                                // ),
                                // ListTile(
                                //   dense: true,
                                //   contentPadding: EdgeInsets.symmetric(vertical: 10),
                                //   leading: Icon(
                                //     Icons.donut_small,
                                //     color: Theme.of(context).hintColor,
                                //   ),
                                //   title: Text(
                                //     "Ingredients",
                                //     style: Theme.of(context).textTheme.subtitle1,
                                //   ),
                                // ),
                                // Helper.applyHtml(context, _con.food.ingredients, style: TextStyle(fontSize: 12)),
                                // ListTile(
                                //   dense: true,
                                //   contentPadding: EdgeInsets.symmetric(vertical: 10),
                                //   leading: Icon(
                                //     Icons.local_activity,
                                //     color: Theme.of(context).hintColor,
                                //   ),
                                //   title: Text(
                                //     S.of(context).nutrition,
                                //     style: Theme.of(context).textTheme.subtitle1,
                                //   ),
                                // ),
                                // Wrap(
                                //   spacing: 8,
                                //   runSpacing: 8,
                                //   children: List.generate(_con.food.nutritions.length, (index) {
                                //     return Container(
                                //       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                //       decoration: BoxDecoration(
                                //           color: Theme.of(context).primaryColor,
                                //           borderRadius: BorderRadius.all(Radius.circular(5)),
                                //           boxShadow: [BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.2), offset: Offset(0, 2), blurRadius: 6.0)]),
                                //       child: Column(
                                //         mainAxisSize: MainAxisSize.min,
                                //         children: <Widget>[
                                //           Text(_con.food.nutritions.elementAt(index).name,
                                //               overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.caption),
                                //           Text(_con.food.nutritions.elementAt(index).quantity.toString(),
                                //               overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headline5),
                                //         ],
                                //       ),
                                //     );
                                //   }),
                                // ),
                                // ListTile(
                                //   dense: true,
                                //   contentPadding: EdgeInsets.symmetric(vertical: 10),
                                //   leading: Icon(
                                //     Icons.recent_actors,
                                //     color: Theme.of(context).hintColor,
                                //   ),
                                //   title: Text(
                                //     S.of(context).reviews,
                                //     style: Theme.of(context).textTheme.subtitle1,
                                //   ),
                                // ),
                                // ReviewsListWidget(
                                //   reviewsList: _con.food.foodReviews,
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Positioned(
                  //   top: 32,
                  //   right: 20,
                  //   child: _con.loadCart
                  //       ? SizedBox(
                  //           width: 60,
                  //           height: 60,
                  //           child: RefreshProgressIndicator(),
                  //         )
                  //       : ShoppingCartFloatButtonWidget(
                  //           iconColor: Theme.of(context).primaryColor,
                  //           labelColor: Theme.of(context).hintColor,
                  //           routeArgument: RouteArgument(param: '/Food', id: _con.food.id),
                  //         ),
                  // ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 150,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                          boxShadow: [BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.15), offset: Offset(0, -2), blurRadius: 5.0)]),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "Quantity",
                                    style: Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: () {
                                        vm.decrementEvent();
                                        vm.updateSubtotal();
                                      },
                                      iconSize: 30,
                                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                      icon: Icon(Icons.remove_circle_outline),
                                      color: Theme.of(context).hintColor,
                                    ),
                                    Text(vm.product.quantity.toString(), style: Theme.of(context).textTheme.subtitle1),
                                    IconButton(
                                      onPressed: () {
                                        vm.incrementEvent();
                                        vm.updateSubtotal();
                                      },
                                      iconSize: 30,
                                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                      icon: Icon(Icons.add_circle_outline),
                                      color: Theme.of(context).hintColor,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                // Expanded(
                                //   child: _con.favorite?.id != null
                                //       ? OutlineButton(
                                //           onPressed: () {
                                //             _con.removeFromFavorite(_con.favorite);
                                //           },
                                //           padding: EdgeInsets.symmetric(vertical: 14),
                                //           color: Theme.of(context).primaryColor,
                                //           shape: StadiumBorder(),
                                //           borderSide: BorderSide(color: Theme.of(context).accentColor),
                                //           child: Icon(
                                //             Icons.favorite,
                                //             color: Theme.of(context).accentColor,
                                //           ))
                                //       : FlatButton(
                                //           onPressed: () {
                                //             if (currentUser.value.apiToken == null) {
                                //               Navigator.of(context).pushNamed("/Login");
                                //             } else {
                                //               _con.addToFavorite(_con.food);
                                //             }
                                //           },
                                //           padding: EdgeInsets.symmetric(vertical: 14),
                                //           color: Theme.of(context).accentColor,
                                //           shape: StadiumBorder(),
                                //           child: Icon(
                                //             Icons.favorite,
                                //             color: Theme.of(context).primaryColor,
                                //           )),
                                // ),
                                SizedBox(width: 10),
                                Stack(
                                  fit: StackFit.loose,
                                  alignment: AlignmentDirectional.centerEnd,
                                  children: <Widget>[
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width - 110,
                                      child: FlatButton(
                                        onPressed: () {
                                          //TODO: add to cart event
                                          vm.addToCartEvent();
                                        },
                                        padding: EdgeInsets.symmetric(vertical: 14),
                                        color: Colors.red,
                                        shape: StadiumBorder(),
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          child: Text(
                                            "Add To Cart",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(vm.product.subtotal.toString(), style:TextStyleUtil.textBold(fontSz:20, tColor:Colors.white)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

