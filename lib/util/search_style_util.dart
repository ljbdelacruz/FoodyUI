

import 'package:flutter/material.dart';

class SearchStyle {
  static OutlineInputBorder get searchBorder {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(35.0),
        borderSide: BorderSide(
          color: Color.fromRGBO(114, 124, 144, 0.5),
        ));
  }
  static OutlineInputBorder get searchFocusedBorder {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(35.0),
        borderSide: BorderSide(
          color: Color.fromRGBO(114, 124, 144, 0.5),
        ));
  }
}