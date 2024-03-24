import 'package:flutter/material.dart';

extension ColorExtension on BuildContext {
  LinearGradient linearGradient(List<Color> colors) => LinearGradient(
      colors: colors, begin: Alignment.topLeft, end: Alignment.bottomRight);
}

extension ColorFilterMaskExtension on Widget {
  ColorFiltered colorFiltered(Color color, [BlendMode? blendMode]) =>
      ColorFiltered(
        colorFilter: ColorFilter.mode(color, blendMode ?? BlendMode.srcIn),
        child: this,
      );
  // BackdropFilter blurBackground([double? blur]) => BackdropFilter(
  //       filter: ImageFilter.blur(sigmaX: blur ?? 8, sigmaY: blur ?? 8),
  //       child: this,
  //     );
  // Widget blurBackgroundWithClip({double? blur, double? borderRadius}) =>
  //     blurBackground(blur).roundBorder(borderRadius ?? 0);
  ShaderMask linearGradient(List<Color> colors,
          {Alignment? begin, Alignment? end}) =>
      ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: colors,
          begin: begin ?? Alignment.centerLeft,
          end: end ?? Alignment.centerRight,
        ).createShader(bounds),
        blendMode: BlendMode.srcIn,
        child: this,
      );

  Opacity opacity(double value) => Opacity(opacity: value, child: this);
}
