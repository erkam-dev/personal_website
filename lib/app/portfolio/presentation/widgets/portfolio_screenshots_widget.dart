import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:personal_website/lib.dart';

class PortfolioScreenshotsWidget extends StatefulWidget {
  final List<String> screenshotPaths;
  const PortfolioScreenshotsWidget({super.key, required this.screenshotPaths});

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
    currentPage = widget.screenshotPaths.length ~/ 2;
    controller = LoopPageController(
      initialPage: widget.screenshotPaths.length ~/ 2,
      viewportFraction: 0.2,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              itemCount: widget.screenshotPaths.length,
              onPageChanged: (value) => setState(() => currentPage = value),
              itemBuilder: (context, index) =>
                  Image.asset(widget.screenshotPaths[index])
                      .roundBorder24()
                      .pad16()
                      .customCard(borderRadius: context.borderRadius32())
                      .animatedScale(switch ((currentPage - index).abs()) {
                        0 => 1,
                        _ => 0.7
                      })
                      .aspectRatio(9 / 16),
            ).sizedBox(height: MediaQuery.sizeOf(context).height / 1.2),
          ],
        )
      ],
    );
  }
}
