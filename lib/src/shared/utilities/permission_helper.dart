import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static Future<bool> checkCameraPermission() async {
    var isGranted = await Permission.camera.isGranted;
    var isLimited = await Permission.camera.isLimited;
    return isGranted || isLimited;
  }

  static Future<bool> checkMicroPermission() async {
    var isGranted = await Permission.microphone.isGranted;
    var isLimited = await Permission.microphone.isLimited;
    return isGranted || isLimited;
  }
}
