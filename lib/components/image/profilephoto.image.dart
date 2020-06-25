






import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foody_ui/typdef/mytypedef.dart';

class ProfilePhotoImage extends StatelessWidget {
  final ProfilePhotoImageVM vm;
  final NormalCallback click;
  ProfilePhotoImage(this.vm, this.click);
  @override
  Widget build(BuildContext context) {
    return Container(
      height:120,
      width:120,
      child: Stack(children: [
        CircleAvatar(
                  radius: 80.0,
                  backgroundImage: CachedNetworkImageProvider(vm.profilePhoto),
                  backgroundColor: Colors.transparent,
        ),
        Positioned(
          bottom: 0,
          right:-20,
          child: button())
        // Align(alignment:Alignment.bottomRight, child:button()),
      ],));
  }
  Widget button(){
    return RawMaterialButton(
    onPressed: this.click,elevation: 0.0,
                          shape: new CircleBorder(
                              side: BorderSide(color: Colors.black45)),
                          fillColor: Colors.white,
                          child: _uploadImageIcon());
  }


  Icon _uploadImageIcon() {
    return Icon(
      Icons.camera_alt,
      color: Colors.black45,
      size: 16.0,
    );
  }
}


class ProfilePhotoImageVM{
  String profilePhoto;
  ProfilePhotoImageVM(this.profilePhoto);
}





