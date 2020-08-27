import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Viewer1Lottie extends StatelessWidget {
  final Viewer1LottieVM vm;
  Viewer1Lottie(this.vm);

  @override
  Widget build(BuildContext context) {
    return Container(
    width:vm.width,
    height:vm.height,
    child: Lottie.asset(vm.animationJSON,
        controller: vm.controller,
        width:vm.height,
        height:vm.height,
        fit: BoxFit.contain,        
        onLoaded: (composition){
        vm.controller..duration = composition.duration..repeat();
    }),);
  }
}

class Viewer1LottieVM{
  String animationJSON;
  double width=300;
  double height=300;
  AnimationController controller;  
  Viewer1LottieVM(this.animationJSON, {this.width=300, this.height=300});
  Viewer1LottieVM.activityPage(this.animationJSON){
    this.width=180.0;
    this.height=180.0;
  }
}