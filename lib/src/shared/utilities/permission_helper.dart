import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../base/define/colors.dart';
import '../../../base/define/size.dart';
import '../../../base/define/theme.dart';
import '../../../generated/l10n.dart';

class PermissionHelper {
  static Future<bool> checkCameraIsAllowed() async {
    var cameraStatus = await Permission.camera.status;
    return cameraStatus != PermissionStatus.denied &&
        cameraStatus != PermissionStatus.permanentlyDenied;
  }

  static Future<bool> checkMicroIsAllowed() async {
    var micStatus = await Permission.microphone.status;
    return micStatus != PermissionStatus.denied && micStatus != PermissionStatus.permanentlyDenied;
  }

  static Future<void> processPermission(
    BuildContext context, {
    VoidCallback? callback,
  }) async {
    var isCamAllow = await checkCameraIsAllowed();
    PermissionStatus? cameraStatus;
    if (!isCamAllow) {
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
        if (cameraStatus == PermissionStatus.permanentlyDenied) {
          await openAppSettings();
          return;
        }
        isCamAllow =
            !cameraStatus.isDenied && !cameraStatus.isPermanentlyDenied;
      }
    }

    var isMicAllow = await checkMicroIsAllowed();
    PermissionStatus? micStatus;
    if (!isMicAllow) {
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
        if (micStatus == PermissionStatus.permanentlyDenied) {
          await openAppSettings();
          return;
        }
        isMicAllow = !(micStatus.isDenied || micStatus.isPermanentlyDenied);
      }
    }

    if (isCamAllow && isMicAllow) {
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
          title,
          style: TextStyle(
            fontSize: titleMediumSize,
            fontWeight: titleMediumWeight,
            color: colorsByTheme(context).defaultFont,
            height: 1.0,
          ),
        ),
        content: Text(
          content,
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
              foregroundColor: AppColor.error,
            ),
            child: Text(
              S.current.txtDeny,
              style: const TextStyle(
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.mainColor2,
              foregroundColor: AppColor.defaultFontLight,
            ),
            child: Text(
              S.current.txtAllow,
              style: const TextStyle(
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
            ),
          ),
        ],
      );
}
