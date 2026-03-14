import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:flutter/material.dart';

class CustomProfileInfoTile extends StatelessWidget {
  const CustomProfileInfoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Ramy Hany Ezzat",
        style: AppTextStyles.heebo500style18
            .copyWith(color: AppColors.deepBrown),
      ),
      subtitle: Text(
        "ramyelshahidy@gmail.com",
        style:
            AppTextStyles.poppins400style16.copyWith(color: AppColors.offGrey),
      ),
      trailing: InkWell(
          onTap: () {},
        child: AppImageRenderer.assets(Assets.imagesEdit)),
      leading: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(32), boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            offset: const Offset(0, 5),
            blurRadius: 10,
          )
        ]),
        child: CircleAvatar(
          radius: 32,
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: AppImageRenderer.assets(Assets.imagesAncientWar,
                height: 64, width: 64, fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
