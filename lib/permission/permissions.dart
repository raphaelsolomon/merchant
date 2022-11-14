// ignore: import_of_legacy_library_into_null_safe
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter/services.dart';

class Permissions {
  static Future<bool> cameraAndMicrophonePermissionsGranted() async {
    bool cameraPermissionStatus = await _getCameraPermission();
    bool microphonePermissionStatus = await _getMicrophonePermission();

    if (cameraPermissionStatus && microphonePermissionStatus) {
      return true;
    } else {
      _handleInvalidPermissions(cameraPermissionStatus, microphonePermissionStatus);
      return false;
    }
  }

  static Future<bool> _getCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isDenied && status.isRestricted && !status.isGranted) {
      Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.camera].request();
      return permissionStatus[Permission.camera]!.isGranted;
    }
    return status.isGranted;
  }

  static Future<bool> _getMicrophonePermission() async {
    var status = await Permission.microphone.status;
    if (status.isDenied && status.isRestricted && !status.isGranted) {
      Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.microphone].request();
      return permissionStatus[Permission.microphone]!.isGranted;
    }
    return status.isGranted;
  }

  static void _handleInvalidPermissions(bool cameraPermissionStatus, bool microphonePermissionStatus) {
    if (cameraPermissionStatus && microphonePermissionStatus) {
      throw PlatformException(
          code: "PERMISSION_DENIED",
          message: "Access to camera and microphone denied",
          details: null);
    }
  }
}
