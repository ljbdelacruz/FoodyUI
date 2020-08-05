import 'package:flutter/material.dart';

class ColorsService{
  static ColorsService instance=ColorsService();

  Color primaryColor(){
    return Color(0xff052A60);
  }
  Color lightBlue(){
    return Color(0xff00D5EE);
  }

  Color yellowColor1(){
    return Color(0xffFFBA00);
  }
  Color yellowColor(){
    return Color(0xffEFC316);
  }
  Color lightYellow(){
    return Color(0xffFFB32C);
  }
  Color unknownColor(){
    return Color(0xff052160);
  }


  Color whiteColor(){
    return Color(0xffffffff);
  }

  Color textColor() {
    return Color(0xff0061A9);
  }

  Color buttonColor() {
    return Color(0xffFFB32C);
  }

  Color greyColor() {
    return Color(0xff7A8089);
  }
  Color darkGreyColor(){
    return Color(0xff707070);
  }
  Color lightGrey(){
    return Color(0xffF7F6FB);
  }
  Color lightGrey1(){
    return Color(0xffEEEEEE);
  }
  Color orangeColor(){
    return Color(0xffFFA028);
  }
  Color redColor(){
    return Color(0xffF15249);
  }
  Color transColor() {
    return Color(0xfff3f3f3);
  }
  Color transColor1(){
    return Color(0xff03CAFF).withOpacity(0.5);
  }
  Color halfStar(){
    return Color(0xFFFFB24D);
  }
  static Color dirtyWhite(){
    return Color(0xffE8E4C9);
  }


}