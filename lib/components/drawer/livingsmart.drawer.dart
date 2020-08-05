
import 'package:flutter/material.dart';
import 'package:foody_ui/typdef/mytypedef.dart';

class LivingSmartDrawer extends StatefulWidget{
  final NormalCallback profileClick;
  final LivingSmartDrawerVM vm;
  final GetIntData optionClick;
  LivingSmartDrawer(this.vm,this.profileClick, this.optionClick);
  @override
  LivingSmartDrawerState createState() => LivingSmartDrawerState();
}
class LivingSmartDrawerState extends State<LivingSmartDrawer> {
  //ProfileController _con;

  @override
  void dispose() {
    super.dispose();
  }

  Widget userProfileInfo(){
    if(widget.vm.email.length > 0){
      return UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor.withOpacity(0.1),
                    ),
                    accountName: Text(
                      widget.vm.name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    accountEmail: Text(
                      widget.vm.email,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      backgroundImage: NetworkImage(widget.vm.image),
                    ),
                  );
    }else{
      return Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).hintColor.withOpacity(0.1),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          size: 32,
                          color: Theme.of(context).accentColor.withOpacity(1),
                        ),
                        SizedBox(width: 30),
                        Text(
                          "Guest",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              widget.profileClick();
            },
            child: userProfileInfo()
          ),
          ListTile(
            onTap: () {
              widget.optionClick(0);
            },
            leading: Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text(
              "Home",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {
              widget.optionClick(1);
            },
            leading: Icon(
              Icons.notifications,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              "Notifications",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {
              widget.optionClick(2);
            },
            leading: Icon(
              Icons.local_mall,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              "My Orders",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {
              widget.optionClick(3);
            },
            leading: Icon(
              Icons.favorite,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              "Favorites",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            dense: true,
            title: Text(
              "Preferences",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            trailing: Icon(
              Icons.remove,
              color: Theme.of(context).focusColor.withOpacity(0.3),
            ),
          ),
          ListTile(
            onTap: () {
              widget.optionClick(4);
            },
            leading: Icon(
              Icons.help,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              "Help & Support",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          ListTile(
            onTap: () {
              widget.optionClick(5);
            },
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              "Settings",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          widget.vm.showMStore ? ListTile(
            onTap: () {
              widget.optionClick(6);
            },
            leading: Icon(
              Icons.swap_horizontal_circle,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              "Switch to MStore",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ) : SizedBox(),
          widget.vm.showMCS ? ListTile(
            onTap: () {
              widget.optionClick(7);
            },
            leading: Icon(
              Icons.swap_horizontal_circle,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              "Switch to Driver",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ): SizedBox(),
          ListTile(
            onTap: () {
              widget.optionClick(8);
            },
            leading: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).focusColor.withOpacity(1),
            ),
            title: Text(
              widget.vm.email.length > 0 ? "Logout" : "Login",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          widget.vm.email.length <= 0
              ? ListTile(
                  onTap: () {
                    // Navigator.of(context).pushNamed('/SignUp');
                    widget.optionClick(9);
                  },
                  leading: Icon(
                    Icons.person_add,
                    color: Theme.of(context).focusColor.withOpacity(1),
                  ),
                  title: Text(
                    "Signup",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                )
              : SizedBox(height: 0),
              ListTile(
                  dense: true,
                  title: Text(
                    "V" + " " + widget.vm.appVersion,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  trailing: Icon(
                    Icons.remove,
                    color: Theme.of(context).focusColor.withOpacity(0.3),
                  ),
              )
        ],
      ),
    );
  }
}

class LivingSmartDrawerVM{
  String email;
  String image;
  String name;
  String appVersion;
  bool showMStore = false;
  bool showMCS = false;
  LivingSmartDrawerVM({this.email = "", this.image = "", this.name = "", this.appVersion = "", this.showMStore = true, this.showMCS = true});
}
