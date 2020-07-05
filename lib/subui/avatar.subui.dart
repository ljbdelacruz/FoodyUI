



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foody_ui/typdef/mytypedef.dart';

class AvatarSubUI{
  static AvatarSubUI instance = AvatarSubUI();

  Widget wUIAvatarImage1(WUIAvatarStyle vm){
    return Container(
                // padding: EdgeInsets.fromLTRB(27.9, 30, 27.9, 30),
                child: Container(
                  width: vm.width,
                  height: vm.height,
                  child:vm.isNetworkImage ? 
                  Container(
                    width:vm.width,
                    height:vm.height,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child:cachedImage(vm, (){
                      //TODO: clicked image
                    })
                  ) : Container(),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      image : AssetImage(vm.src),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff000000).withOpacity(0.25),
                        blurRadius:
                            15.0, // has the effect of softening the shadow
                        spreadRadius:
                            0.5, // has the effect of extending the shadow
                        offset: Offset(
                          0.0, // horizontal, move right 10
                          10.0, // vertical, move down 10
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }


  Widget cachedImage(WUIAvatarStyle vm, NormalCallback click){
    return GestureDetector(
                    onTap: click,
                    child: Container(
                    width: vm.width, height: vm.height,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          bottomLeft: Radius.circular(100),
                        ),
                        child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: vm.src,
                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      )
                  ),);
  }

}

class WUIAvatarStyle{
  String src;
  double height;
  double width;
  bool isNetworkImage;
  WUIAvatarStyle(this.src, {this.isNetworkImage = false, this.width = 150, this.height = 150});
}