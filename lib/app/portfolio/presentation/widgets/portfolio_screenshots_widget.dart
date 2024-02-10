import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:personal_website/lib.dart';

class PortfolioScreenshotsWidget extends StatefulWidget {
  final List<String>? screenshotPaths;
  const PortfolioScreenshotsWidget({super.key, this.screenshotPaths});

  @override
  State<PortfolioScreenshotsWidget> createState() =>
      _PortfolioScreenshotsWidgetState();
}

class _PortfolioScreenshotsWidgetState
    extends State<PortfolioScreenshotsWidget> {
  int currentPage = 0;
  LoopPageController controller = LoopPageController();
  @override
  void initState() {
    if ((widget.screenshotPaths ?? []).isNotEmpty) {
      currentPage = widget.screenshotPaths!.length ~/ 2;
      controller = LoopPageController(
        initialPage: widget.screenshotPaths!.length ~/ 2,
        viewportFraction: 0.5,
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.screenshotPaths ?? []).isEmpty
        ? const SizedBox()
        : Column(
            children: [
              Text(
                "Screenshots",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  LoopPageView.builder(
                    controller: controller,
                    itemCount: (widget.screenshotPaths ?? []).length,
                    onPageChanged: (value) =>
                        setState(() => currentPage = value),
                    itemBuilder: (context, index) =>
                        Image.asset(widget.screenshotPaths![index])
                            .roundBorder16()
                            .animatedContainer(
                              padding: context
                                  .edgeInsets(currentPage - index == 0 ? 8 : 0),
                            )
                            .customCard(borderRadius: 24)
                            .animatedScale(switch (
                                (currentPage - index).abs()) {
                              0 => 1,
                              _ => 0.7
                            })
                            .centerWidget(),
                  ).sizedBox(height: 600),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.navigate_before_rounded)
                          .pad16()
                          .inkwell(() => controller.animateToPage(
                              currentPage - 1 < 0
                                  ? widget.screenshotPaths!.length - 1
                                  : currentPage - 1,
                              duration: context.durationMilliseconds300(),
                              curve: Curves.easeOutCubic))
                          .roundBorder16()
                          .customCard(),
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width / 1.5 - 100),
                      const Icon(Icons.navigate_next_rounded)
                          .pad16()
                          .inkwell(() => controller.animateToPage(
                              currentPage + 1 >= widget.screenshotPaths!.length
                                  ? 0
                                  : currentPage + 1,
                              duration: context.durationMilliseconds300(),
                              curve: Curves.easeOutCubic))
                          .roundBorder16()
                          .customCard(),
                    ],
                  ).pad32()
                ],
              )
            ],
          );
  }
}
