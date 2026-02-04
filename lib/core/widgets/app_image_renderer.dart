import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


enum SourceType {
  assets,
  network,
}

class AppImageRenderer extends StatefulWidget {
  final SourceType sourceType;
  final String imageUrl;
  final BoxFit fit;
  final double? height;
  final double? width;
  const AppImageRenderer({super.key, required this.sourceType, required this.imageUrl, this.fit = BoxFit.contain, this.height, this.width});

  static Widget network(
    String imageUrl, {
    BoxFit fit = BoxFit.contain,
    double? height,
    double? width,
  }) =>
      AppImageRenderer(
        sourceType: SourceType.network,
        imageUrl: imageUrl,
        fit: fit,
        height: height,
        width: width,
      );

  static Widget assets(
    String imageUrl, {
    BoxFit fit = BoxFit.contain,
    double? height,
    double? width,
  }) =>
      AppImageRenderer(
        sourceType: SourceType.assets,
        imageUrl: imageUrl,
        fit: fit,
        height: height,
        width: width,
      );

  @override
  State<AppImageRenderer> createState() => _AppImageRendererState();
}

class _AppImageRendererState extends State<AppImageRenderer> {
  bool isSvg = false;

  @override
  void initState() {
    checkUrl();
    super.initState();
  }

  void checkUrl() {
    try {
      String extintion = widget.imageUrl.substring(widget.imageUrl.length - 3, widget.imageUrl.length);
      if (extintion == "svg") {
        isSvg = true;
      }
    } catch (e) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    late Widget image;

    if (isSvg) {
      // if (SVG)
      if (widget.sourceType == SourceType.network) {
        // if network
        image = SvgPicture.network(
          widget.imageUrl,
          fit: widget.fit,
        );
      } else {
        // if assets
        image = SvgPicture.asset(
          widget.imageUrl,
          fit: widget.fit,
        );
      }
    } else {
      // if (png , jpg , gif)  and other
      if (widget.sourceType == SourceType.network) {
        // if network
        image = Image.network(
          widget.imageUrl,
          fit: widget.fit,
        );
      } else {
        // if assets
        image = Image.asset(
          widget.imageUrl,
          fit: widget.fit,
        );
      }
    }
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: image,
    );
  }
}
