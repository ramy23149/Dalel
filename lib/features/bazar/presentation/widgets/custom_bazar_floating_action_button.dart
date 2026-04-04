import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:flutter/material.dart';

class CustomBazarFloatingActionButton extends StatelessWidget {
  const CustomBazarFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
     shape: CircleBorder(),
      backgroundColor: AppColors.primaryColor,
      onPressed: () {},
      child: AppImageRenderer.assets(
        Assets.imagesShoppingCartIcon,
        width: 24,
        height: 24,
      ),
    );
  }
}
