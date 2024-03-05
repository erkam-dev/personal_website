import 'package:flutter/material.dart';

class SmartImageWidget extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  const SmartImageWidget(
      {super.key, required this.imagePath, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return (imagePath.startsWith("assets")
        ? Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: width,
            height: height,
          )
        : imagePath.isNotEmpty
            ? Image.network(
                imagePath,
                fit: BoxFit.cover,
                width: width,
                height: height,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              )
            : const SizedBox());
  }
}
