/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

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

  /// File path: assets/icon/ic_feedback.svg
  SvgGenImage get icFeedback =>
      const SvgGenImage('assets/icon/ic_feedback.svg');

  /// File path: assets/icon/ic_language.svg
  SvgGenImage get icLanguage =>
      const SvgGenImage('assets/icon/ic_language.svg');

  /// File path: assets/icon/ic_noti.svg
  SvgGenImage get icNoti => const SvgGenImage('assets/icon/ic_noti.svg');

  /// File path: assets/icon/ic_noti_header.svg
  SvgGenImage get icNotiHeader =>
      const SvgGenImage('assets/icon/ic_noti_header.svg');

  /// File path: assets/icon/ic_paint_palette.svg
  SvgGenImage get icPaintPalette =>
      const SvgGenImage('assets/icon/ic_paint_palette.svg');

  /// File path: assets/icon/ic_rating_star.svg
  SvgGenImage get icRatingStar =>
      const SvgGenImage('assets/icon/ic_rating_star.svg');

  /// File path: assets/icon/ic_rating_star_selected.svg
  SvgGenImage get icRatingStarSelected =>
      const SvgGenImage('assets/icon/ic_rating_star_selected.svg');

  /// File path: assets/icon/ic_search_header.svg
  SvgGenImage get icSearchHeader =>
      const SvgGenImage('assets/icon/ic_search_header.svg');

  /// File path: assets/icon/ic_send.svg
  SvgGenImage get icSend => const SvgGenImage('assets/icon/ic_send.svg');

  /// File path: assets/icon/ic_warning.svg
  SvgGenImage get icWarning => const SvgGenImage('assets/icon/ic_warning.svg');

  /// File path: assets/icon/list.png
  AssetGenImage get list => const AssetGenImage('assets/icon/list.png');

  /// File path: assets/icon/notifications.png
  AssetGenImage get notifications =>
      const AssetGenImage('assets/icon/notifications.png');

  /// File path: assets/icon/radio_selected.svg
  SvgGenImage get radioSelected =>
      const SvgGenImage('assets/icon/radio_selected.svg');

  /// File path: assets/icon/radio_unselected.svg
  SvgGenImage get radioUnselected =>
      const SvgGenImage('assets/icon/radio_unselected.svg');

  /// File path: assets/icon/settings.png
  AssetGenImage get settings => const AssetGenImage('assets/icon/settings.png');

  /// File path: assets/icon/wallet.png
  AssetGenImage get wallet => const AssetGenImage('assets/icon/wallet.png');

  /// List of all assets
  List<dynamic> get values => [
        account,
        chat,
        icFeedback,
        icLanguage,
        icNoti,
        icNotiHeader,
        icPaintPalette,
        icRatingStar,
        icRatingStarSelected,
        icSearchHeader,
        icSend,
        icWarning,
        list,
        notifications,
        radioSelected,
        radioUnselected,
        settings,
        wallet
      ];
}

class $AssetsIllustrationGen {
  const $AssetsIllustrationGen();

  /// File path: assets/illustration/reset-password.svg
  SvgGenImage get resetPassword =>
      const SvgGenImage('assets/illustration/reset-password.svg');

  /// File path: assets/illustration/sign-in.svg
  SvgGenImage get signIn =>
      const SvgGenImage('assets/illustration/sign-in.svg');

  /// File path: assets/illustration/sign-up.svg
  SvgGenImage get signUp =>
      const SvgGenImage('assets/illustration/sign-up.svg');

  /// List of all assets
  List<SvgGenImage> get values => [resetPassword, signIn, signUp];
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
    String? package,
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

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated Clip? clipBehavior,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      // colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      // clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
