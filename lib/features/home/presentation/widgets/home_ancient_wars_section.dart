import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAncientWarsSection extends StatelessWidget {
  const HomeAncientWarsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeaderText(text: AppStrings.ancient_wars),
          //  SizedBox(height: 16),
            AspectRatio(
              aspectRatio: 16 / 8,
              child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: cubit.onPageChanged,
                  controller: cubit.pageController,
                  itemCount: 3,
                  itemBuilder: (context, index) => ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      child: AppImageRenderer.assets(cubit.ancientWarsImages[index]))),
            ),
          ],
        );
      },
    );
  }
}
