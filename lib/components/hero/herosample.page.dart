

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/typdef/mytypedef.dart';

class HeroSamplePage extends StatefulWidget {
  final NormalCallback callback;
  final HeroSamplePageVM vm;
  HeroSamplePage(this.vm, this.callback);
  @override
  HeroSamplePageState createState() => HeroSamplePageState();
}

class HeroSamplePageState extends State<HeroSamplePage> {

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      this.showInfo();
    }

    @override
    Widget build(BuildContext context) {
      return SafeArea(child: Scaffold(body:Center(child: Hero(tag: widget.vm.tag,
      child: Container(
        width:MediaQuery.of(context).size.width,
        child:Column(children:[
        CachedNetworkImage(
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: widget.vm.image,
                    placeholder: (context, url) => Image.asset(
                      'assets/img/loading.gif',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 300,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Visibility(visible: widget.vm.isShow, child: Column(children:[
          Text(widget.vm.title),
          Text(widget.vm.desc)
        ]))
      ])),))));
    }
    showInfo() async {
      await Future.delayed(Duration(milliseconds: 60), () {
        print('delay completed');
        setState((){
          widget.vm.isShow=true;
        });
      });
    }
}
class HeroSamplePageVM{
  String tag;
  String image;
  String title;
  String desc;
  bool isShow = false;
  HeroSamplePageVM(this.tag, {this.image = "", this.title="", this.desc=""});
}