

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:polygon_clipper/polygon_border.dart';

class ShapeStyleUtil{
  
  static PolygonBorder get shapePolygon{
    return PolygonBorder(
      sides: 6,
      borderRadius: 7.0, // Default 0.0 degrees
      rotate: 180, // Default 0.0 degrees
      border: BorderSide(color: Colors.blue[400], width: 5.0) // Default BorderSide.none
    );
  }
}