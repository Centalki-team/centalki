import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../base/define/colors.dart';
import '../../../base/define/size.dart';
import '../../../base/define/theme.dart';
import '../../../generated/l10n.dart';

class PermissionHelper {
  static Future<bool> checkCameraPermission() async {
    var isDenied = await Permission.camera.isDenied;
    var isPermanentlyDenied = await Permission.camera.isPermanentlyDenied;
    return !(isDenied && isPermanentlyDenied);
  }

  static Future<bool> checkMicroPermission() async {
    var isDenied = await Permission.microphone.isDenied;
    var isPermanentlyDenied = await Permission.microphone.isPermanentlyDenied;
    return !(isDenied && isPermanentlyDenied);
  }

  static Future<void> processPermission(
    BuildContext context, {
    VoidCallback? callback,
  }) async {
    var checkCamPermission = await checkCameraPermission();
    PermissionStatus? cameraStatus;
    if (!checkCamPermission) {
      // ignore: use_build_context_synchronously
      final result = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => PermissionDialog(
          title: S.current.txtCamPermissionTitle,
          content: S.current.txtCamPermissionContent,
        ),
      );
      if (result) {
        cameraStatus = await Permission.camera.request();
        checkCamPermission =
            !(cameraStatus.isDenied || cameraStatus.isPermanentlyDenied);
      }
    }

    var checkMicPermission = await checkMicroPermission();
    PermissionStatus? micStatus;
    if (!checkMicPermission) {
      // ignore: use_build_context_synchronously
      final result = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => PermissionDialog(
          title: S.current.txtMicPermissionTitle,
          content: S.current.txtMicPermissionContent,
        ),
      );
      if (result) {
        micStatus = await Permission.microphone.request();
        checkMicPermission =
            !(micStatus.isDenied || micStatus.isPermanentlyDenied);
      }
    }

    if (checkCamPermission && checkMicPermission) {
      callback?.call();
    }
  }
}

class PermissionDialog extends StatelessWidget {
  const PermissionDialog({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) => AlertDialog(
        backgroundColor: colorsByTheme(context).backgroundCardsChip,
        title: Text(
          S.current.txtEndProgress,
          style: TextStyle(
            fontSize: titleMediumSize,
            fontWeight: titleMediumWeight,
            color: colorsByTheme(context).defaultFont,
            height: 1.0,
          ),
        ),
        content: Text(
          S.current.txtEndProgressContent,
          style: TextStyle(
            fontSize: bodyLargeSize,
            fontWeight: bodyLargeWeight,
            color: colorsByTheme(context).defaultFont,
            height: 1.0,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            style: TextButton.styleFrom(
              foregroundColor: AppColor.mainColor1,
            ),
            child: Text(
              S.current.txtOk,
              style: const TextStyle(
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.error,
              foregroundColor: Colors.white,
            ),
            child: Text(
              S.current.txtCancel,
              style: const TextStyle(
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
            ),
          ),
        ],
      );
}
