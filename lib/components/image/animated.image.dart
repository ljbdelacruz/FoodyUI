import 'package:flutter/material.dart';
import 'package:foody_ui/components/label/titletext.label.dart';
import 'package:foody_ui/theme/lightcolor.theme.dart';
import 'package:cached_network_image/cached_network_image.dart';


class AnimatedImage extends StatelessWidget {
  final AnimatedImageVM vm;
  AnimatedImage(this.vm);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        builder: (context, child) {
          return AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: vm.opacity,
            child: child,
          );
        },
        animation: vm.animation,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            TitleText(
              text: vm.initial,
              fontSize: 160,
              color: LightColor.darkgrey,
            ),
            CachedNetworkImage(imageUrl: vm.image,)
          ],
        ),
      );
  }
}

class AnimatedImageVM{
  String initial;
  double opacity;
  String image;
  Animation<double> animation;
  AnimatedImageVM(this.initial, this.opacity, this.animation, this.image);
}