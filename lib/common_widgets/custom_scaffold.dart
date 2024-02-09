import 'package:flutter/material.dart';
import 'package:personal_website/core/core.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomScaffold extends StatelessWidget {
  final String? title;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final AlignmentDirectional? persistentFooterAlignment;
  final Widget? drawer;
  final void Function(bool)? onDrawerChanged;
  final Widget? endDrawer;
  final void Function(bool)? onEndDrawerChanged;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool? extendBody;
  final bool? extendBodyBehindAppBar;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final String? restorationId;
  const CustomScaffold({
    super.key,
    this.title,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.restorationId,
    this.persistentFooterAlignment,
    this.extendBody,
    this.extendBodyBehindAppBar,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xFF86a1ff), Color(0xFFaf89ff)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
        ),
        Scaffold(
          appBar: appBar ??
              AppBar(
                automaticallyImplyLeading: false,
                title: SizedBox(
                    child: (title ?? "").isEmpty && Navigator.canPop(context)
                        ? TextButton.icon(
                            icon: Icon(
                              Icons.navigate_before_rounded,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            label: Text(
                              "Back",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                            onPressed: () => context.popWhenPoppable(),
                          ).customCard()
                        : Text(title ?? "")),
                actions: [
                  Text(
                    "Contact Me",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  )
                      .inkwell(
                          () => launchUrl(Uri.parse("mailto:info@erkam.dev")))
                      .pad8(vertical: false)
                      .customCard()
                      .padOnly(right: 16)
                ],
              ),
          backgroundColor: backgroundColor ?? Colors.transparent,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          drawer: drawer,
          drawerEdgeDragWidth: drawerEdgeDragWidth,
          drawerScrimColor: drawerScrimColor,
          endDrawer: endDrawer,
          extendBody: extendBody ?? false,
          extendBodyBehindAppBar: extendBodyBehindAppBar ?? true,
          floatingActionButton: floatingActionButton,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
          floatingActionButtonLocation: floatingActionButtonLocation,
          key: key,
          onDrawerChanged: onDrawerChanged,
          onEndDrawerChanged: onEndDrawerChanged,
          persistentFooterAlignment:
              persistentFooterAlignment ?? AlignmentDirectional.center,
          persistentFooterButtons: persistentFooterButtons,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          restorationId: restorationId,
        )
      ],
    );
  }
}
