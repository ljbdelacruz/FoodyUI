import 'package:flutter/material.dart';
import 'package:foody_ui/components/progress/circularloading.progress.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foody_ui/util/text_style_util.dart';

class ReviewsListWidgetItem{
  String id;
  String name;
  String title;
  String desc;
  String image;
  double review;
  ReviewsListWidgetItem({this.id="", this.name = "", this.title="", this.desc="", this.image = "", this.review=4.0});
}

class ReviewsList1WidgetVM{
  List<ReviewsListWidgetItem> reviewsList;
  ReviewsList1WidgetVM(this.reviewsList);
}


// ignore: must_be_immutable
class ReviewsList1Widget extends StatelessWidget {
  ReviewsList1WidgetVM vm;
  ReviewsList1Widget(this.vm);

  @override
  Widget build(BuildContext context) {
    return vm.reviewsList.isEmpty
        ? CircularLoadingWidget(height: 200)
        : ListView.separated(
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return ReviewItemWidget(vm.reviewsList.elementAt(index));
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 20);
            },
            itemCount: vm.reviewsList.length,
            primary: false,
            shrinkWrap: true,
          );
  }
}

class ReviewItemWidget extends StatelessWidget {
  final ReviewsListWidgetItem review;

  ReviewItemWidget(this.review);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Wrap(
        direction: Axis.horizontal,
        runSpacing: 10,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                child: CachedNetworkImage(
                  height: 65,
                  width: 65,
                  fit: BoxFit.cover,
                  imageUrl: review.image,
                  // placeholder: (context, url) => Image.asset(
                  //   'assets/img/loading.gif',
                  //   fit: BoxFit.cover,
                  //   height: 65,
                  //   width: 65,
                  // ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(width: 15),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            review.name,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Theme.of(context).hintColor)),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                          child: Chip(
                            padding: EdgeInsets.all(0),
                            label: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(review.review.toString(), style: TextStyleUtil.textBold(fontSz:14, tColor:Colors.white)),
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
                    Text(
                      review.title,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              )
            ],
          ),
          Text(
            review.desc,
            style: Theme.of(context).textTheme.bodyText2,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            maxLines: 3,
          )
        ],
      ),
    );
  }
}
