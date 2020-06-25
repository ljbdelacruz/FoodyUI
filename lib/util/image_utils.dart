

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foody_ui/components/bottomsheet/platform_bottom_sheet.dart';
import 'package:foody_ui/typdef/mytypedef.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';



class ImageUtils {
  static Future<void> pickImage(
    BuildContext context,
    Function(File file) onFilePicked, {
    double maxWidth,
    double maxHeight,
  }) async {
    int imageQuality = 90;

    PlatformBottomSheet.showBottomSheet(
      context,
      [
        ActionSheet("Gallery", () async {
          onFilePicked(
            await ImagePicker.pickImage(
                source: ImageSource.gallery,
                imageQuality: imageQuality,
                maxHeight: maxHeight,
                maxWidth: maxWidth),
          );
        }, leading: Icon(Icons.photo_library), popAutomatically: true),
        ActionSheet("Camera", () async {
          onFilePicked(
            await ImagePicker.pickImage(
                source: ImageSource.camera,
                imageQuality: imageQuality,
                maxHeight: maxHeight,
                maxWidth: maxWidth),
          );
        }, leading: Icon(Icons.camera), popAutomatically: true),
      ],
    );
  }

  static squareImageCropper(BuildContext context, FileCallback uploadImg){
                                ImageUtils.pickImage(
                              context,
                              (File file) async {
                                File croppedFile = await ImageCropper.cropImage(
                                    sourcePath: file.path,
                                    aspectRatioPresets: [
                                      CropAspectRatioPreset.ratio16x9
                                    ],
                                    androidUiSettings: AndroidUiSettings(
                                        toolbarTitle: "Image",
                                        hideBottomControls: true,
                                        showCropGrid: true,
                                        toolbarColor: Colors.blue,
                                        toolbarWidgetColor: Colors.white,
                                        initAspectRatio:
                                            CropAspectRatioPreset.ratio16x9,
                                        lockAspectRatio: true),
                                    iosUiSettings: IOSUiSettings(
                                        minimumAspectRatio: 1.0,
                                        aspectRatioLockEnabled: true,
                                        aspectRatioPickerButtonHidden: true,
                                        title: "Image"));
                                  uploadImg(croppedFile);
                              },
                              maxWidth: 1024,
                              maxHeight: 512,
                            );
  }

  static circleImageCropper(BuildContext context, FileCallback uploadImg){
                                ImageUtils.pickImage(
                              context,
                              (File file) async {
                                File croppedFile = await ImageCropper.cropImage(
                                    sourcePath: file.path,
                                    cropStyle: CropStyle.circle,
                                    aspectRatioPresets: [
                                      CropAspectRatioPreset.square
                                    ],
                                    androidUiSettings: AndroidUiSettings(
                                        toolbarTitle: "Profile Image",
                                        hideBottomControls: true,
                                        showCropGrid: true,
                                        toolbarColor: Colors.blue,
                                        toolbarWidgetColor: Colors.white,
                                        initAspectRatio:
                                            CropAspectRatioPreset.square,
                                        lockAspectRatio: true),
                                    iosUiSettings: IOSUiSettings(
                                        minimumAspectRatio: 1.0,
                                        aspectRatioLockEnabled: true,
                                        aspectRatioPickerButtonHidden: true,
                                        title: "Profile Image"));
                              },
                              maxWidth: 1024,
                              maxHeight: 512,
                            );
  }



}