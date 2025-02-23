import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SmoothPageView extends StatefulWidget {
  final List<Widget> children;
  final Axis? scrollDirection;
  final Padding? padding;
  final Function(int value)? onPageChanged;
  final PageController? controller;
  final bool? pageSnapping;

  const SmoothPageView({
    super.key,
    required this.children,
    this.scrollDirection,
    this.padding,
    this.onPageChanged,
    this.controller,
    this.pageSnapping,
  });
  @override
  SmoothPageViewState createState() => SmoothPageViewState();
}

class SmoothPageViewState extends State<SmoothPageView> {
  final sink = StreamController<double>();
  PageController pager = PageController();

  @override
  void initState() {
    super.initState();
    pager = widget.controller ?? PageController();
    throttle(sink.stream).listen((offset) {
      pager.animateTo(
        offset,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
      );
    });
  }

  @override
  void dispose() {
    sink.close();
    pager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: _handlePointerSignal,
      child: _IgnorePointerSignal(
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: PageView(
            pageSnapping: widget.pageSnapping ?? false,
            controller: pager,
            onPageChanged: widget.onPageChanged,
            scrollDirection: widget.scrollDirection ?? Axis.vertical,
            children: widget.children,
          ),
        ),
      ),
    );
  }

  Stream<double> throttle(Stream<double> src) async* {
    double offset = pager.position.pixels;
    DateTime dt = DateTime.now();
    await for (var delta in src) {
      if (DateTime.now().difference(dt) > const Duration(milliseconds: 200)) {
        offset = pager.position.pixels;
      }
      dt = DateTime.now();
      offset += delta;
      yield offset;
    }
  }

  void _handlePointerSignal(PointerSignalEvent e) {
    if (e is PointerScrollEvent &&
        e.scrollDelta.dy != 0 &&
        e.kind == PointerDeviceKind.mouse &&
        e.kind != PointerDeviceKind.trackpad) {
      sink.add(e.scrollDelta.dy);
    }
  }
}

// workaround https://github.com/flutter/flutter/issues/35723
class _IgnorePointerSignal extends SingleChildRenderObjectWidget {
  const _IgnorePointerSignal({super.child});

  @override
  RenderObject createRenderObject(_) => _IgnorePointerSignalRenderObject();
}

class _IgnorePointerSignalRenderObject extends RenderProxyBox {
  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    final res = super.hitTest(result, position: position);
    for (var item in result.path) {
      final target = item.target;
      if (target is RenderPointerListener) {
        target.onPointerSignal = null;
      }
    }
    return res;
  }
}
