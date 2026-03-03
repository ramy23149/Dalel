import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/core/widgets/custom_loading_indecator_list.dart';
import 'package:dalel_app/features/home/presentation/cubits/wars_cubit/wars_cubit.dart';
import 'package:dalel_app/features/home/presentation/widgets/historical_war_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WarsDetailsSection extends StatelessWidget {
  const WarsDetailsSection({super.key, });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WarsCubit, WarsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeaderText(
              text: "Acient Egypt ${AppStrings.Wars}",
            ),
            SizedBox(
              height: 16,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                    top: -48,
                    right: 0,
                    child:
                        AppImageRenderer.assets(Assets.imagesDetailsPharaoh)),
              if (state is WarsLoaded) 
                 SizedBox(
                  height: 100,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.wars.length,
                    itemBuilder: (context, index) => HistoricalWarItem(
                      warModel: state.wars[index],
                    ),
                  ),
                ),
              if (state is WarsError)
                Center(
                  child: Text(
                    state.message,
                    style: AppTextStyles.poppins400style16,
                  ),
                ),
                if (state is WarsLoading)
                  const CustomLoadingIndecatorList(wideContainer: true,)
              ],
            ),
          ],
        );
      },
    );
  }
}
