

import 'package:flutter/material.dart';

// List acctList = [
//   {
//     'name': 'James Jimenez',
//     'image': 'assets/images/timeline/mario_c_reyes.jpg'
//   },
//   {
//     'name': 'James Jimenez Merchant',
//     'image': 'assets/images/timeline/mario_c_reyes.jpg'
//   }
// ];

//this is how to use modal on other side
          // SwitchAccountModal modal = new SwitchAccountModal();
          // modal.mainBottomSheet(context, "test", ListItems);

class SwitchAccountModalItems{
  String name;
  String image;
  SwitchAccountModalItems(this.name, this.image);
}


class SwitchAccountModal {
  mainBottomSheet(BuildContext context, String title, List<SwitchAccountModalItems> items) {
    showModalBottomSheet(
        backgroundColor: Colors.grey[200],
        context: context,
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ))),
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: List.generate(items.length, (index) {
                      return _createList(index, items, context);
                    }),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _createList(index, List<SwitchAccountModalItems> details, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: FlatButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        onPressed: () => {},
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(details[index].image),
                            fit: BoxFit.cover)),
                  ),
                ),
                Text(details[index].name)
              ],
            )
          ],
        ),
      ),
    );
  }
}
