




import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/typdef/mytypedef.dart';

class FuiFooterSubUI{

  static FuiFooterSubUI instance = FuiFooterSubUI();

  Widget footer1(int currentTab, GetIntData selected, List<FUIFooterItems> iconList, {Color unselectedC = Colors.blue, Color selectedC = Colors.red}){
    return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: selectedC,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          iconSize: 22,
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedIconTheme: IconThemeData(size: 28),
          unselectedItemColor: unselectedC,
          currentIndex: currentTab,
          onTap: (int i) {
            selected(i);
          },
          // this will be set when a new tab is tapped
          items:  bottomNavOptions(iconList),
        );
  }

  List<BottomNavigationBarItem> bottomNavOptions(List<FUIFooterItems> icons){
    List<BottomNavigationBarItem> items = [];
    icons.forEach((icon) {
      if(icon.type == 0){
        items.add(bottomNavBarItem(icon:icon.icon));
      }else{
        items.add(bottomNavBarItem1(icon:icon.icon));
      }
    });
    return items;
  }

  BottomNavigationBarItem bottomNavBarItem({String title = "",IconData icon = Icons.favorite, double tSize = 15, Color tColor = Colors.grey}){
    return BottomNavigationBarItem(
              icon: new Icon(icon, size: tSize, color:tColor),
              title: new Container(height: 0.0),
    );
  }
  BottomNavigationBarItem bottomNavBarItem1({IconData icon = Icons.favorite, Color tColor = Colors.grey, Color iColor = Colors.white}){
      return BottomNavigationBarItem(
                title: new Container(height: 5.0),
                icon: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: tColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(color: tColor.withOpacity(0.4), blurRadius: 40, offset: Offset(0, 15)),
                      BoxShadow(color: tColor.withOpacity(0.4), blurRadius: 13, offset: Offset(0, 3))
                    ],
                  ),
                  child: new Icon(icon, color: iColor),
                )
      );
  }
}

class FUIFooterItems{
  IconData icon;
  int type = 0;
  FUIFooterItems({this.icon=Icons.favorite, this.type = 0});
  FUIFooterItems.temp({this.icon=Icons.favorite, this.type = 0});
  FUIFooterItems.temp1({this.icon=Icons.favorite, this.type = 1});
}