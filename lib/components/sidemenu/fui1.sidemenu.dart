import 'package:flutter/material.dart';
import 'package:foody_ui/typdef/mytypedef.dart';
import 'package:foody_ui/util/text_style_util.dart';

class FUI1Sidemenu extends StatefulWidget {
  final NormalCallback clickProfile;
  final FUI1SidemenuVM vm;
  FUI1Sidemenu(this.vm,this.clickProfile);
  @override
  FUI1SidemenuState createState() => FUI1SidemenuState();
}

class FUI1SidemenuState extends State<FUI1Sidemenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          userInfo(),
          // GestureDetector(
          //   onTap: () {
          //     // currentUser.value.apiToken != null ? Navigator.of(context).pushNamed('/Profile') : Navigator.of(context).pushNamed('/Login');
          //   },

          //   child: currentUser.value.apiToken != null
          //       ? UserAccountsDrawerHeader(
          //           decoration: BoxDecoration(
          //             color: Theme.of(context).hintColor.withOpacity(0.1),
          //           ),
          //           accountName: Text(
          //             widget.vm.username,
          //             style: Theme.of(context).textTheme.headline6,
          //           ),
          //           accountEmail: Text(
          //             widget.vm.email,
          //             style: Theme.of(context).textTheme.caption,
          //           ),
          //           currentAccountPicture: CircleAvatar(
          //             backgroundColor: Theme.of(context).accentColor,
          //             backgroundImage: NetworkImage(widget.vm.userImage),
          //           ),
          //         )
          //       : Container(
          //           padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          //           decoration: BoxDecoration(
          //             color: Theme.of(context).hintColor.withOpacity(0.1),
          //           ),
          //           child: Row(
          //             children: <Widget>[
          //               Icon(
          //                 Icons.person,
          //                 size: 32,
          //                 color: Theme.of(context).accentColor.withOpacity(1),
          //               ),
          //               SizedBox(width: 30),
          //               Text(
          //                 S.of(context).guest,
          //                 style: Theme.of(context).textTheme.headline6,
          //               ),
          //             ],
          //           ),
          //         ),
          // ),
          Column(children:setupOptions(widget.vm.options, (data){}),),
          ListTile(
            dense: true,
            title: Text(
             widget.vm.option1Header,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            trailing: Icon(
              Icons.remove,
              color: Theme.of(context).focusColor.withOpacity(0.3),
            ),
          ),
          Column(children:setupOptions(widget.vm.options1, (data){}),),
          versionNumber(widget.vm.version),
          // ListTile(
          //   onTap: () {
          //     Navigator.of(context).pushNamed('/Pages', arguments: 2);
          //   },
          //   leading: Icon(
          //     Icons.home,
          //     color: Theme.of(context).focusColor.withOpacity(1),
          //   ),
          //   title: Text(
          //     S.of(context).home,
          //     style: Theme.of(context).textTheme.subtitle1,
          //   ),
          // ),
          // ListTile(
          //   onTap: () {
          //     Navigator.of(context).pushNamed('/Pages', arguments: 0);
          //   },
          //   leading: Icon(
          //     Icons.notifications,
          //     color: Theme.of(context).focusColor.withOpacity(1),
          //   ),
          //   title: Text(
          //     S.of(context).notifications,
          //     style: Theme.of(context).textTheme.subtitle1,
          //   ),
          // ),
          // ListTile(
          //   onTap: () {
          //     Navigator.of(context).pushNamed('/Pages', arguments: 3);
          //   },
          //   leading: Icon(
          //     Icons.local_mall,
          //     color: Theme.of(context).focusColor.withOpacity(1),
          //   ),
          //   title: Text(
          //     S.of(context).my_orders,
          //     style: Theme.of(context).textTheme.subtitle1,
          //   ),
          // ),
          // ListTile(
          //   onTap: () {
          //     Navigator.of(context).pushNamed('/Pages', arguments: 4);
          //   },
          //   leading: Icon(
          //     Icons.favorite,
          //     color: Theme.of(context).focusColor.withOpacity(1),
          //   ),
          //   title: Text(
          //     S.of(context).favorite_product,
          //     style: Theme.of(context).textTheme.subtitle1,
          //   ),
          // ),
          // ListTile(
          //   onTap: () {
          //     Navigator.of(context).pushNamed('/Help');
          //   },
          //   leading: Icon(
          //     Icons.help,
          //     color: Theme.of(context).focusColor.withOpacity(1),
          //   ),
          //   title: Text(
          //     S.of(context).help__support,
          //     style: Theme.of(context).textTheme.subtitle1,
          //   ),
          // ),
          // ListTile(
          //   onTap: () {
          //     if (currentUser.value.apiToken != null) {
          //       Navigator.of(context).pushNamed('/Settings');
          //     } else {
          //       Navigator.of(context).pushReplacementNamed('/Login');
          //     }
          //   },
          //   leading: Icon(
          //     Icons.settings,
          //     color: Theme.of(context).focusColor.withOpacity(1),
          //   ),
          //   title: Text(
          //     S.of(context).settings,
          //     style: Theme.of(context).textTheme.subtitle1,
          //   ),
          // ),
          // ListTile(
          //   onTap: () {
          //     Navigator.of(context).pushNamed('/Merchant');
          //   },
          //   leading: Icon(
          //     Icons.swap_horizontal_circle,
          //     color: Theme.of(context).focusColor.withOpacity(1),
          //   ),
          //   title: Text(
          //     S.of(context).switch_to_merchant,
          //     style: Theme.of(context).textTheme.subtitle1,
          //   ),
          // ),
          // ListTile(
          //   onTap: () {
          //     Navigator.of(context).pushNamed('/Driver');
          //   },
          //   leading: Icon(
          //     Icons.swap_horizontal_circle,
          //     color: Theme.of(context).focusColor.withOpacity(1),
          //   ),
          //   title: Text(
          //     S.of(context).switch_to_driver,
          //     style: Theme.of(context).textTheme.subtitle1,
          //   ),
          // ),
          // ListTile(
          //   onTap: () {
          //     Navigator.of(context).pushNamed('/Languages');
          //   },
          //   leading: Icon(
          //     Icons.translate,
          //     color: Theme.of(context).focusColor.withOpacity(1),
          //   ),
          //   title: Text(
          //     S.of(context).languages,
          //     style: Theme.of(context).textTheme.subtitle1,
          //   ),
          // ),
          // ListTile(
          //   onTap: () {
          //     if (Theme.of(context).brightness == Brightness.dark) {
          //       setBrightness(Brightness.light);
          //       setting.value.brightness.value = Brightness.light;
          //     } else {
          //       setting.value.brightness.value = Brightness.dark;
          //       setBrightness(Brightness.dark);
          //     }
          //     setting.notifyListeners();
          //   },
          //   leading: Icon(
          //     Icons.brightness_6,
          //     color: Theme.of(context).focusColor.withOpacity(1),
          //   ),
          //   title: Text(
          //     Theme.of(context).brightness == Brightness.dark ? S.of(context).light_mode : S.of(context).dark_mode,
          //     style: Theme.of(context).textTheme.subtitle1,
          //   ),
          // ),
          // ListTile(
          //   onTap: () {
          //     if (currentUser.value.apiToken != null) {
          //       logout().then((value) {
          //         Navigator.of(context).pushNamedAndRemoveUntil('/Pages', (Route<dynamic> route) => false, arguments: 2);
          //       });
          //     } else {
          //       Navigator.of(context).pushNamed('/Login');
          //     }
          //   },
          //   leading: Icon(
          //     Icons.exit_to_app,
          //     color: Theme.of(context).focusColor.withOpacity(1),
          //   ),
          //   title: Text(
          //     currentUser.value.apiToken != null ? S.of(context).log_out : S.of(context).login,
          //     style: Theme.of(context).textTheme.subtitle1,
          //   ),
          // ),
          // currentUser.value.apiToken == null
          //     ? ListTile(
          //         onTap: () {
          //           Navigator.of(context).pushNamed('/SignUp');
          //         },
          //         leading: Icon(
          //           Icons.person_add,
          //           color: Theme.of(context).focusColor.withOpacity(1),
          //         ),
          //         title: Text(
          //           S.of(context).register,
          //           style: Theme.of(context).textTheme.subtitle1,
          //         ),
          //       )
          //     : SizedBox(height: 0),
        ],
      ),
    );
  }
  Widget userInfo(){
    return UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor.withOpacity(0.1),
                    ),
                    accountName: Text(
                      widget.vm.username,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    accountEmail: Text(
                      widget.vm.email,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      backgroundImage: NetworkImage(widget.vm.userImage),
                    ),
      );
  }
  Widget sideMenuHeader(String text, {double fontSz = 12, Color tColor = Colors.grey}){
    return ListTile(
            dense: true,
            title: Text(
              text,
              style: TextStyleUtil.textNormal(fontSz:fontSz, tColor:tColor),
            ),
            trailing: Icon(
              Icons.remove,
              color: Theme.of(context).focusColor.withOpacity(0.3),
            ),
          );
  }

  List<Widget> setupOptions(List<FUI1SideMenu1Option> options, GetIntData click){
    List<Widget> woptions = [];
    options.forEach((element) { 
      woptions.add(optionMenu(element.option, (){
        click(element.id);
      }, icon:element.icon));
    });
    return woptions;
  }


  Widget optionMenu(String text, NormalCallback click, {Color iColor = Colors.grey, double iconSz=20, double fontSz = 12, Color tColor = Colors.grey, IconData icon = Icons.ac_unit}){
    return ListTile(
            onTap: click,
            leading: Icon(
              icon,
              color: iColor,
              size: iconSz,
            ),
            title: Text(
              text,
              style: TextStyleUtil.wUITextFieldLabel(fontSz:fontSz, color: tColor),
            ),
          );
  }
  Widget versionNumber(String version, {double fontFz}){
    return ListTile(
                  dense: true,
                  title: Text(
                    version,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  trailing: Icon(
                    Icons.remove,
                    color: Theme.of(context).focusColor.withOpacity(0.3),
                  ),
                );
  }
}

class FUI1SidemenuVM{
  String userImage;
  String username;
  String email;
  String version;
  List<FUI1SideMenu1Option> options = [];
  String option1Header;
  List<FUI1SideMenu1Option> options1 = [];
  FUI1SidemenuVM(this.options,{this.userImage = "", this.username = "", this.email = "", this.option1Header = "", this.options1, this.version = ""}){
    if(this.options1 == null){
      this.options1 = [];
    }
  }
  FUI1SidemenuVM.temp({this.userImage = "", this.username = "", this.email = "", this.option1Header = "", this.options1, this.version = ""}){
    this.options = [];
    this.options1 = [];
    this.options.add(FUI1SideMenu1Option(id:0, option:"Test 2", icon:Icons.settings));
    this.options.add(FUI1SideMenu1Option(id:0, option:"Test 2", icon:Icons.settings));
    this.options1.add(FUI1SideMenu1Option(id:0, option:"Test option 1", icon:Icons.settings));
  }


}

class FUI1SideMenu1Option{
  int id;
  String option;
  IconData icon;
  FUI1SideMenu1Option({this.id = 0, this.option = "", this.icon=Icons.access_alarm});
}


