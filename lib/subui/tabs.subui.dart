



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/util/text_style_util.dart';

class TabsSubUI{
  static TabsSubUI instance = TabsSubUI();
  Color dusColor = Color(0xffeeeeee).withOpacity(0.5);
  Color dlblColor = Color(0xfff5a623);

  Widget wUITabs(List<String> options, TabController controller, {Color usColor = Colors.white, Color lblColor = Colors.white, indiColor = Colors.white}){
    // usColor = usColor == null ? dusColor : usColor;
    // lblColor = lblColor == null ? dlblColor : lblColor;
    List<Widget> tabs = [];
    options.forEach((option) { 
      tabs.add(wUITabItem(option, tColor:lblColor));
    });
    return TabBar(
            controller:controller,
            unselectedLabelColor: usColor,
            labelColor: lblColor,
            indicatorColor: indiColor,
            tabs: tabs,
          );
  }
  Widget wUITabItem(String label, {tColor = Colors.white}){
    return Tab(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyleUtil.wUITextFieldLabel(fontSz: 12, color: tColor),
                  ),
                ),
    );
  }

}