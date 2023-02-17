/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAvatarGen {
  const $AssetsAvatarGen();

  /// File path: assets/avatar/avatar-01.png
  AssetGenImage get avatar01 =>
      const AssetGenImage('assets/avatar/avatar-01.png');

  /// List of all assets
  List<AssetGenImage> get values => [avatar01];
}

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/account.png
  AssetGenImage get account => const AssetGenImage('assets/icon/account.png');

  /// File path: assets/icon/chat.png
  AssetGenImage get chat => const AssetGenImage('assets/icon/chat.png');

  /// File path: assets/icon/list.png
  AssetGenImage get list => const AssetGenImage('assets/icon/list.png');

  /// File path: assets/icon/notifications.png
  AssetGenImage get notifications =>
      const AssetGenImage('assets/icon/notifications.png');

  /// File path: assets/icon/settings.png
  AssetGenImage get settings => const AssetGenImage('assets/icon/settings.png');

  /// File path: assets/icon/wallet.png
  AssetGenImage get wallet => const AssetGenImage('assets/icon/wallet.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [account, chat, list, notifications, settings, wallet];
}

class $AssetsIllustrationGen {
  const $AssetsIllustrationGen();

  /// File path: assets/illustration/login.png
  AssetGenImage get login =>
      const AssetGenImage('assets/illustration/login.png');

  /// File path: assets/illustration/register.png
  AssetGenImage get register =>
      const AssetGenImage('assets/illustration/register.png');

  /// File path: assets/illustration/reset_password.png
  AssetGenImage get resetPassword =>
      const AssetGenImage('assets/illustration/reset_password.png');

  /// List of all assets
  List<AssetGenImage> get values => [login, register, resetPassword];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/temp_all_topic.png
  AssetGenImage get tempAllTopic =>
      const AssetGenImage('assets/images/temp_all_topic.png');

  /// List of all assets
  List<AssetGenImage> get values => [tempAllTopic];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/centalki-background.png
  AssetGenImage get centalkiBackground =>
      const AssetGenImage('assets/logo/centalki-background.png');

  /// File path: assets/logo/centalki-banner.png
  AssetGenImage get centalkiBanner =>
      const AssetGenImage('assets/logo/centalki-banner.png');

  /// File path: assets/logo/centalki.png
  AssetGenImage get centalki => const AssetGenImage('assets/logo/centalki.png');

  /// File path: assets/logo/facebook.png
  AssetGenImage get facebook => const AssetGenImage('assets/logo/facebook.png');

  /// File path: assets/logo/google.png
  AssetGenImage get google => const AssetGenImage('assets/logo/google.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [centalkiBackground, centalkiBanner, centalki, facebook, google];
}

class Assets {
  Assets._();

  static const $AssetsAvatarGen avatar = $AssetsAvatarGen();
  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsIllustrationGen illustration = $AssetsIllustrationGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package = 'centalki',
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => 'packages/centalki/$_assetName';
}
