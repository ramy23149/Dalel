import 'package:dalel_app/core/functions/custom_navigation.dart';
import 'package:dalel_app/core/routes/app_router.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/core/widgets/custom_loading_indecator_horizontal_list.dart';
import 'package:dalel_app/features/home/presentation/cubits/historical_characters_cubit/historical_characters_cubit.dart';
import 'package:dalel_app/core/widgets/custom_category_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalCharactersSection extends StatelessWidget {
  const HistoricalCharactersSection({super.key, required this.headerText});
  final String headerText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: headerText),
        SizedBox(height: 16),
        BlocBuilder<HistoricalCharactersCubit, HistoricalCharactersState>(
          builder: (context, state) {
            if (state is HistoricalCharactersLoading) {
              return CustomLoadingIndecatorHorizontalList(
                wideContainer: false,
              );
            } else if (state is HistoricalCharactersError) {
              return Center(
                child: Text(
                  state.message,
                  style: AppTextStyles.poppins400style16,
                ),
              );
            } else if (state is HistoricalCharactersLoaded) {
              return SizedBox(
                height: 170,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => CustomCategoryListViewItem(
                    name: state.historicalCharactersModels[index].name,
                    image: state.historicalCharactersModels[index].image!,
                    onTap: () => customPushNavigation(
                        AppRouter.kHistoricalCharacterDetailsView,
                        arguments: state.historicalCharactersModels[index]),
                  ),
                  itemCount: state.historicalCharactersModels.length,
                  scrollDirection: Axis.horizontal,
                ),
              );
            }
            return Container();
          },
        ),
      ],
    );
  }
}
