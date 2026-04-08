import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/app_image_renderer.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/core/widgets/custom_loading_indecator_horizontal_list.dart';
import 'package:dalel_app/features/home/data/enums/historical_type_enum.dart';
import 'package:dalel_app/features/home/presentation/cubits/wars_cubit/wars_cubit.dart';
import 'package:dalel_app/features/home/presentation/widgets/historical_war_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomWarsListViewSection extends StatelessWidget {
  const CustomWarsListViewSection({
    super.key,
    required this.title,
    required this.historicalType,
  });
  final String title;
  final HistoricalType historicalType;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WarsCubit, WarsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state is WarsLoaded)
              CustomHeaderText(
                text: "$title ${AppStrings.Wars}",
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
                  child: _listImage(),
                ),
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
                  const CustomLoadingIndecatorHorizontalList(
                    wideContainer: true,
                  )
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _listImage() {
    return historicalType == HistoricalType.historicalPeriod
        ? AppImageRenderer.assets(Assets.imagesDetailsPharaoh)
        : Row(children: [
            AppImageRenderer.assets(Assets.imagesDetailsSmallCircle),
            SizedBox(
              width: 7,
            ),
            AppImageRenderer.assets(Assets.imagesDetailsBigCircle),
          ]);
  }
}
