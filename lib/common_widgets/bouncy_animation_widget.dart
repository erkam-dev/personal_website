import 'package:flutter/material.dart';
import 'package:personal_website/core/core.dart';

class BouncyAnimationWidget extends StatefulWidget {
  final Widget child;
  final Function()? onTap;
  final double? scaleOnTap;
  final Duration? duration;
  final bool? useInkwell;
  const BouncyAnimationWidget({
    super.key,
    required this.child,
    this.scaleOnTap,
    this.duration,
    this.useInkwell,
    this.onTap,
  });

  @override
  State<BouncyAnimationWidget> createState() => _BouncyAnimationWidgetState();
}

class _BouncyAnimationWidgetState extends State<BouncyAnimationWidget> {
  double defaultScale = 1;
  double scale = 1;
  @override
  Widget build(BuildContext context) {
    return widget.useInkwell == true
        ? widget.child
            .animatedScale(
              scale,
              duration: widget.duration ?? context.durationMilliseconds150(),
            )
            .inkwell(
              widget.onTap,
              onTapDown: (details) =>
                  setState(() => scale = widget.scaleOnTap ?? scale),
              onTapUp: (details) => setState(() => scale = defaultScale),
              onTapCancel: () => setState(() => scale = defaultScale),
            )
        : widget.child
            .animatedScale(
              scale,
              duration: widget.duration ?? context.durationMilliseconds150(),
            )
            .gestureDetector(
              widget.onTap,
              onTapDown: (details) =>
                  setState(() => scale = widget.scaleOnTap ?? scale),
              onTapUp: (details) => setState(() => scale = defaultScale),
              onTapCancel: () => setState(() => scale = defaultScale),
            );
  }
}
