import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  static Future<bool> requestCameraPermission() async {
    var cameraStatus = await Permission.camera.request();
    return cameraStatus.isGranted;
  }

  static Future<bool> requestStoragePermission() async {
    var storageStatus = await Permission.storage.request();
    return storageStatus.isGranted;
  }

  static Future<bool> requestPermissions() async {
    bool cameraGranted = await requestCameraPermission();
    bool storageGranted = await requestStoragePermission();
    return cameraGranted || storageGranted;
  }
}
