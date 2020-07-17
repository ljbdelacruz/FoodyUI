


import 'package:foody_ui/config/constants.instance.dart';
import 'package:foody_ui/typdef/mytypedef.dart';

class ScreenService{
  static adjustMPINSize(GetDouble2Data scall){
    if(Constants.instance.deviceData.width <= 1080){
      scall(80, 90);
    }else if(Constants.instance.deviceData.width <= 900){
      scall(60, 70);
    }else {
      scall(50, 60);
    }
  }
}

class ScreenAdjustmentsService{
  static adjustPINCode(GetDouble2Data scall){
    if(Constants.instance.deviceData.width <= 1080){
      scall(80.00, 90.00);
    }else if(Constants.instance.deviceData.width <= 900){
      scall(60.00, 70.00);
    }else if(Constants.instance.deviceData.width <= 800){
      scall(50.00, 50.00);
    }
  }
}