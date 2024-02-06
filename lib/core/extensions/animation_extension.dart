import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/common_widgets/bouncy_animation_widget.dart';

extension AnimationExtension on Widget {
  AnimatedSize animatedSize(
          {Duration? duration,
          AlignmentGeometry alignment = Alignment.center}) =>
      AnimatedSize(
        duration: duration ?? const Duration(milliseconds: 300),
        alignment: alignment,
        curve: Curves.easeOutCubic,
        child: this,
      );
  AnimatedScale animatedScale(double scale, {Duration? duration}) =>
      AnimatedScale(
        duration: duration ?? const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        scale: scale,
        child: this,
      );
  BouncyAnimationWidget animatedScaleOnTap(
          {Function()? onTap,
          Duration? duration,
          double? scaleOnTap,
          bool? useInkwell}) =>
      BouncyAnimationWidget(
          duration: duration,
          scaleOnTap: scaleOnTap,
          useInkwell: useInkwell,
          onTap: onTap,
          child: this);
  AnimatedRotation animatedRotation(double turns, {Duration? duration}) =>
      AnimatedRotation(
        turns: turns,
        duration: duration ?? const Duration(milliseconds: 300),
        child: this,
      );
  AnimatedSwitcher animatedSwitcher({Duration? duration}) => AnimatedSwitcher(
      duration: duration ?? const Duration(milliseconds: 300), child: this);
  PageTransitionSwitcher pageTransitionSwitcher({Duration? duration}) =>
      PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          fillColor: Colors.transparent,
          child: this,
        ),
        duration: duration ?? const Duration(milliseconds: 300),
        child: this,
      );
}
