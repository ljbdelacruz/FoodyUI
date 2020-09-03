




import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/components/carousel/imagethumb.carousel.dart';
import 'package:foody_ui/components/cells/fooditem2widget.cells.dart';
import 'package:foody_ui/components/list/reviewlist1.widget.dart';
import 'package:foody_ui/components/progress/circularloading.progress.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foody_ui/services/color.service.dart';
import 'package:foody_ui/util/text_style_util.dart';


class DFStoreInfoPageVM{
  GlobalKey<ScaffoldState> scaffoldKey;
  DFStoreInfoPageDetails productDetails;
  String heroTag;
  DFStoreInfoPageVM({this.scaffoldKey, this.productDetails, this.heroTag="sample"});
}

class DFStoreInfoPageVMDesign{
  Color tColor;
  Color bgColor;

  DFStoreInfoPageVMDesign({this.tColor = Colors.grey, this.bgColor=Colors.white});
}

class DFStoreInfoPageDetails{
  String id;
  String mainImage;
  String title;
  String distance;
  bool isOpen;
  String description;
  List<String> carouselImages = [];
  String operatingHours;
  String locationAddress;
  String mobileNumber;
  String telePhone;

  List<FoodItem2WidgetProduct> productItems = [];
  List<ReviewsListWidgetItem> productReviews = [];
  double review;
  DFStoreInfoPageDetails({this.id="", this.mainImage="", this.title="", this.distance="", this.isOpen=false, this.description="", this.operatingHours="", this.locationAddress="", this.review=4.0, this.mobileNumber="", this.telePhone=""});
}

class DFStoreInfoPage extends StatelessWidget {
  final DFStoreInfoPageVM vm;

  DFStoreInfoPage(this.vm);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        key: vm.scaffoldKey,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Navigator.of(context).pushNamed('/Menu', arguments: new RouteArgument(id: widget.routeArgument.id));
          },
          isExtended: true,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          icon: Icon(
            Icons.restaurant,
            color: Colors.white,
          ),
          label: Text(
            "Menu",
            style: TextStyleUtil.textBold(fontSz:12, tColor: Colors.white),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: RefreshIndicator(
          onRefresh: (){},
          child: vm.productDetails == null
              ? CircularLoadingWidget(height: 500)
              : Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    CustomScrollView(
                      primary: true,
                      shrinkWrap: false,
                      slivers: <Widget>[
                        SliverAppBar(
                          backgroundColor: Theme.of(context).accentColor.withOpacity(0.9),
                          expandedHeight: 300,
                          elevation: 0,
                          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
                          flexibleSpace: FlexibleSpaceBar(
                            collapseMode: CollapseMode.parallax,
                            background: Hero(
                              tag: vm.heroTag,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: vm.productDetails.mainImage,
                                // placeholder: (context, url) => Image.asset(
                                //   'assets/loader/loading.gif',
                                //   fit: BoxFit.cover,
                                // ),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10, top: 25),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        vm.productDetails.title,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                        maxLines: 2,
                                        style: TextStyleUtil.textBold(fontSz:25, tColor:Colors.grey),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 32,
                                      child: Chip(
                                        padding: EdgeInsets.all(0),
                                        label: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(vm.productDetails.review.toString(),
                                                style: TextStyleUtil.textBold(fontSz:15, tColor:Colors.white)),
                                            Icon(
                                              Icons.star_border,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                        backgroundColor: Theme.of(context).accentColor.withOpacity(0.9),
                                        shape: StadiumBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(width: 20),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                                    decoration:
                                        BoxDecoration(color:vm.productDetails.isOpen ? Colors.grey : Colors.green, borderRadius: BorderRadius.circular(24)),
                                    child: vm.productDetails.isOpen
                                        ? Text(
                                            "CLOSED",
                                            style: TextStyleUtil.textBold(fontSz:12, tColor:Colors.white),
                                          )
                                        : Text(
                                            "OPEN",
                                            style: TextStyleUtil.textBold(fontSz:12, tColor:Colors.white),
                                          ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(child: SizedBox(height: 0)),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                                    child: Text(
                                      vm.productDetails.distance,
                                      style: TextStyleUtil.textBold(fontSz:15, tColor:ColorsService.instance.primaryColor())
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                child: Text(vm.productDetails.description),
                              ),
                              ImageThumbCarouselWidget(imageList: vm.productDetails.carouselImages),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: ListTile(
                                  dense: true,
                                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                                  leading: Icon(
                                    Icons.stars,
                                    color: Theme.of(context).hintColor,
                                  ),
                                  title: Text(
                                    "Information",
                                    style: Theme.of(context).textTheme.headline4,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                child: Text(vm.productDetails.operatingHours),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                color: ColorsService.instance.lightGrey(),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        vm.productDetails.locationAddress,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    SizedBox(
                                      width: 42,
                                      height: 42,
                                      child: FlatButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {
                                          //TODO: Direction to the restaurant

                                          // Navigator.of(context).pushNamed('/Pages', arguments: new RouteArgument(id: '1', param: _con.restaurant));
                                        },
                                        child: Icon(
                                          Icons.directions,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                        color: ColorsService.instance.primaryColor(),
                                        shape: StadiumBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                color: ColorsService.instance.lightGrey(),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        '${vm.productDetails.telePhone} \n${vm.productDetails.mobileNumber}',
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    SizedBox(
                                      width: 42,
                                      height: 42,
                                      child: FlatButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {
                                          // launch("tel:${_con.restaurant.mobile}");
                                        },
                                        child: Icon(
                                          Icons.call,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                        color: ColorsService.instance.primaryColor(),
                                        shape: StadiumBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              vm.productDetails.productItems.isEmpty
                                  ? SizedBox(height: 0)
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: ListTile(
                                        dense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                                        leading: Icon(
                                          Icons.restaurant,
                                          color: Theme.of(context).hintColor,
                                        ),
                                        title: Text(
                                          "Featured Products",
                                          style: Theme.of(context).textTheme.headline4,
                                        ),
                                      ),
                                    ),
                              vm.productDetails.productItems.isEmpty
                                  ? SizedBox(height: 0)
                                  : ListView.separated(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: vm.productDetails.productItems.length,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(height: 10);
                                      },
                                      itemBuilder: (context, index) {
                                        return FoodItem2Widget(
                                          FoodItem2WidgetVM(
                                          heroTag: 'food_detailsoption'+vm.productDetails.productItems.elementAt(index).id,
                                          item: vm.productDetails.productItems.elementAt(index)),
                                        );
                                      },
                                    ),
                              SizedBox(height: 100),
                              vm.productDetails.productReviews.isEmpty
                                  ? SizedBox(height: 5)
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                      child: ListTile(
                                        dense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                                        leading: Icon(
                                          Icons.recent_actors,
                                          color: Theme.of(context).hintColor,
                                        ),
                                        title: Text(
                                          "What they Say?",
                                          style: Theme.of(context).textTheme.headline4,
                                        ),
                                      ),
                                    ),
                              vm.productDetails.productItems.isEmpty
                                  ? SizedBox(height: 5)
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      child: ReviewsList1Widget(ReviewsList1WidgetVM(vm.productDetails.productReviews)),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Positioned(
                    //   top: 32,
                    //   right: 20,
                    //   child: ShoppingCartFloatButtonWidget(
                    //     iconColor: Theme.of(context).primaryColor,
                    //     labelColor: Theme.of(context).hintColor,
                    //     routeArgument: RouteArgument(param: '/Details', id: widget.routeArgument.id),
                    //   ),
                    // ),
                  ],
                ),
        ));
  }


}