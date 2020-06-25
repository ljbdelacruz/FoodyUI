




import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foody_ui/typdef/mytypedef.dart';
class ProductCarousel extends StatefulWidget{
  final ProductCarouselVM vm;
  ProductCarousel(this.vm);
  @override
  ProductCarouselState createState() => ProductCarouselState();
}
class ProductCarouselState extends State<ProductCarousel>{
  @override
  Widget build(BuildContext context) {
        return Container(
      height:210,
      child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 0.4,
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: widget.vm.slidersItem,
          ),
    );
  }
}
class ProductCarouselVM{
  List<Widget> slidersItem = [];
  ProductCarouselVM(this.slidersItem);
  ProductCarouselVM.netImageList(List<ProductCarouselItems> images, GetStringData scall){
     this.slidersItem = images.map((data) =>  GestureDetector(onTap:(){
       scall(data.value);
      }, child: Container(
      width:200,
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(imageUrl:data.imageUrl, fit: BoxFit.fill, width: 200, height: 300),
            ],
          )
        ),
      ),
      ))
      ).toList();
  }
}

class ProductCarouselItems{
  String imageUrl;
  String value;
  ProductCarouselItems(this.imageUrl, this.value);
}