


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/typdef/mytypedef.dart';

class SnackBarService{

  static SnackBarService instance=SnackBarService();

  SnackBar showCartSnackBar(BuildContext context, String message, String btn1, NormalCallback click){
    return SnackBar(
            content: Text(message),
            action: SnackBarAction(
              label: btn1,
              onPressed: click,
            ),
    );
  }
}