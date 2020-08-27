


import 'package:flutter/widgets.dart';
import 'package:foody_ui/components/slivers/customscroll.slivers.dart';
import 'package:foody_ui/components/slivers/stack.sliver.dart';

class SliversSubUI{
  static SliversSubUI instance = SliversSubUI();

  Widget stackOption(List<Widget> options, int row){
    return CustomScrollSlivers(CustomScrollSliversVM([
        StackSliver(StackSliverVM(options, row))
    ], Axis.vertical));
  }
}