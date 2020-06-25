import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foody_ui/typdef/mytypedef.dart';

class ProfilePhoto1Image extends StatelessWidget {
  final ProfilePhoto1ImageVM vm;
  final NormalCallback click;
  ProfilePhoto1Image(this.vm, this.click);
  @override
  Widget build(BuildContext context) {
    return Container(
      height:vm.height,
      width:vm.width,
      child: Stack(children: [
        GestureDetector(onTap:this.click, 
        child:CircleAvatar(
                  radius: vm.width / 2,
                  backgroundImage: CachedNetworkImageProvider(vm.profilePhoto),
                  backgroundColor: Colors.transparent,
        ),),
        // Align(alignment:Alignment.bottomRight, child:button()),
      ],));
  }
  Icon _uploadImageIcon() {
    return Icon(
      Icons.camera_alt,
      color: Colors.black45,
      size: 16.0,
    );
  }
}


class ProfilePhoto1ImageVM{
  String profilePhoto;
  double width;
  double height;
  ProfilePhoto1ImageVM(this.profilePhoto, this.width, this.height);
}





