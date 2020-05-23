import 'package:flutter/widgets.dart';

typedef GetStringData= void Function(String data);
typedef GetDateTimeCallback = void Function(DateTime url);
typedef GetIntData(int data);
typedef GetInt2Data(int data, int data2);
typedef GetDynamicData(dynamic data);
typedef NormalCallback();
typedef ContextCallback(BuildContext context);