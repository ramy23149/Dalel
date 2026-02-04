import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Dalel());
}

class Dalel extends StatelessWidget {
  const Dalel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: AppImageRenderer.assets(Assets.imagesOnbording2),
        )
      )
    );
  }
}