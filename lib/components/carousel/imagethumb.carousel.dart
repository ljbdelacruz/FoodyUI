import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foody_ui/components/progress/circularloading.progress.dart';



class ImageThumbCarouselWidget extends StatefulWidget {
  final List<String> imageList;

  ImageThumbCarouselWidget({Key key, this.imageList}) : super(key: key);

  @override
  _ImageThumbCarouselWidgetState createState() => _ImageThumbCarouselWidgetState();
}

class _ImageThumbCarouselWidgetState extends State<ImageThumbCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.imageList.isEmpty
        ? SizedBox(height: 5)
        : Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.imageList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Theme.of(context).accentColor.withOpacity(0.8),
                  highlightColor: Colors.transparent,
                  onTap: () {},
                  child: GalleryItemWidget(image: widget.imageList.elementAt(index)),
                );
              },
            ),
          );
  }
}

class GalleryItemWidget extends StatelessWidget {
  final String image;

  GalleryItemWidget({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return image == null
        ? CircularLoadingWidget(height: 200)
        : Container(
            width: 250,
            margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Theme.of(context).accentColor.withOpacity(0.1), blurRadius: 15, offset: Offset(0, 5)),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: this.image,
                // placeholder: (context, url) => Image.asset(
                //   'assets/loader/loading.gif',
                //   fit: BoxFit.cover,
                // ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          );
  }
}



