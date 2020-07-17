

import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:device_info/device_info.dart';


class Constants{
  static Constants instance=Constants();
  DeviceInfo deviceData = DeviceInfo.mydefault();
}


class DeviceInfo{
  String deviceId="1ee";
  String deviceType="I";
  String appVersion="1.02";
  String osVersion="1.0";
  String manufacturer;
  double width=0;
  double height=0;

  DeviceInfo.mydefault(){
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();    
    if(Platform.isIOS){
      deviceInfo.iosInfo.then((data){
        this.deviceId=data.identifierForVendor;
      });
      this.deviceType="I";
      this.manufacturer="Apple";
    }else{
      deviceInfo.androidInfo.then((data){
        this.deviceId=data.androidId;
      });
      this.manufacturer="Android";      
      this.deviceType="A";      
    }
    this.getDeviceHeight();
  }

  String getDeviceInfo(){
        return jsonEncode({"DeviceVersion" :'Iphone 7', "IMEINumber" : "",
                    "NetworkCountryISO" : 150,
                    "SIMCountryISO" :340,
                    "SIMSerialID" : "",
                    "SIMState" : "",
                           "UUIDNumber" :"1ee",
                           "DeviceManufacturer" : "Apple",
                           "PhoneNumber" : "09394242879",
                           "DeviceOS" : "",
                           "BuildVersion" : ""
          });
  }
  double getDeviceWidth(){
    this.width=window.physicalSize.width;
    return width;
  }
  double getDeviceHeight(){
    this.height=window.physicalSize.height;
    return height;
  }
}
