import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingManager {
  static OverlayEntry? _overlayEntry;

  static void _showLoading({required BuildContext context}) {
    final overlayEntry = OverlayEntry(
        builder: (context) => const Material(
              color: Colors.transparent,
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            ));
    if (Overlay.of(context) != null) {
      LoadingManager._overlayEntry = overlayEntry;
      Overlay.of(context)!.insert(overlayEntry);
    }
  }

  static void _hideLoading() {
    LoadingManager._overlayEntry?.remove();
    LoadingManager._overlayEntry = null;
  }

  static void setLoading(bool loading, BuildContext context) {
    if (loading) {
      if (LoadingManager._overlayEntry == null) {
        LoadingManager._showLoading(context: context);
      }
    } else {
      LoadingManager._hideLoading();
    }
  }
}
