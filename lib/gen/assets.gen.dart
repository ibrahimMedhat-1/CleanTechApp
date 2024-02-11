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

class $LangGen {
  const $LangGen();

  /// File path: lang/ar.json
  String get ar => 'lang/ar.json';

  /// File path: lang/en.json
  String get en => 'lang/en.json';

  /// List of all assets
  List<String> get values => [ar, en];
}

class $AssetsDemoGen {
  const $AssetsDemoGen();

  /// File path: assets/demo/demo1.png
  AssetGenImage get demo1 => const AssetGenImage('assets/demo/demo1.png');

  /// File path: assets/demo/moneytransfer.png
  AssetGenImage get moneytransfer =>
      const AssetGenImage('assets/demo/moneytransfer.png');

  /// List of all assets
  List<AssetGenImage> get values => [demo1, moneytransfer];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Minus.png
  AssetGenImage get minus => const AssetGenImage('assets/images/Minus.png');

  /// File path: assets/images/background_login.png
  AssetGenImage get backgroundLogin =>
      const AssetGenImage('assets/images/background_login.png');

  /// File path: assets/images/call_icon.png
  AssetGenImage get callIcon =>
      const AssetGenImage('assets/images/call_icon.png');

  /// File path: assets/images/customer.png
  AssetGenImage get customer =>
      const AssetGenImage('assets/images/customer.png');

  /// File path: assets/images/home.png
  AssetGenImage get home => const AssetGenImage('assets/images/home.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo_white.png
  AssetGenImage get logoWhite =>
      const AssetGenImage('assets/images/logo_white.png');

  /// File path: assets/images/messaging.png
  AssetGenImage get messaging =>
      const AssetGenImage('assets/images/messaging.png');

  /// File path: assets/images/question.png
  AssetGenImage get question =>
      const AssetGenImage('assets/images/question.png');

  /// File path: assets/images/splash12.png
  AssetGenImage get splash12 =>
      const AssetGenImage('assets/images/splash12.png');

  /// File path: assets/images/splash_screen.png
  AssetGenImage get splashScreen =>
      const AssetGenImage('assets/images/splash_screen.png');

  /// File path: assets/images/total_commissions.png
  AssetGenImage get totalCommissions =>
      const AssetGenImage('assets/images/total_commissions.png');

  /// File path: assets/images/total_salary.png
  AssetGenImage get totalSalary =>
      const AssetGenImage('assets/images/total_salary.png');

  /// File path: assets/images/whats_app.png
  AssetGenImage get whatsApp =>
      const AssetGenImage('assets/images/whats_app.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        minus,
        backgroundLogin,
        callIcon,
        customer,
        home,
        logo,
        logoWhite,
        messaging,
        question,
        splash12,
        splashScreen,
        totalCommissions,
        totalSalary,
        whatsApp
      ];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/have_problem.svg
  SvgGenImage get haveProblem =>
      const SvgGenImage('assets/svgs/have_problem.svg');

  /// File path: assets/svgs/question.svg
  SvgGenImage get question => const SvgGenImage('assets/svgs/question.svg');

  /// File path: assets/svgs/visibilityField.svg
  SvgGenImage get visibilityField =>
      const SvgGenImage('assets/svgs/visibilityField.svg');

  /// File path: assets/svgs/visibilityOffField.svg
  SvgGenImage get visibilityOffField =>
      const SvgGenImage('assets/svgs/visibilityOffField.svg');

  /// List of all assets
  List<SvgGenImage> get values =>
      [haveProblem, question, visibilityField, visibilityOffField];
}

class Assets {
  Assets._();

  static const $AssetsDemoGen demo = $AssetsDemoGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
  static const $LangGen lang = $LangGen();
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

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
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
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
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
