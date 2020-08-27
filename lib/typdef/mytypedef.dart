import 'dart:io';

import 'package:flutter/widgets.dart';

typedef GetStringData= void Function(String data);
typedef GetString2Data= void Function(String data, String data1);
typedef GetDateTimeCallback = void Function(DateTime url);
typedef GetIntData(int data);
typedef GetInt2Data(int data, int data2);
typedef GetDoubleData(double data2);
typedef GetDouble2Data(double data, double data2);
typedef GetDynamicData(dynamic data);
typedef NormalCallback();
typedef ContextCallback(BuildContext context);
typedef FileCallback(File file);
