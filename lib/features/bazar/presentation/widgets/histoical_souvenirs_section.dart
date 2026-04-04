import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/custom_category_list_view_item.dart';
import 'package:dalel_app/core/widgets/custom_loading_indecator_horizontal_list.dart';
import 'package:dalel_app/features/bazar/presentation/cubits/bazar_souvenirs_cubit/bazar_souvenirs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalSouvenirsSection extends StatelessWidget {
  const HistoricalSouvenirsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BazarSouvenirsCubit, BazarSouvenirsState>(
      builder: (context, state) {
        if (state is BazarSouvenirsSuccess) {
          return SizedBox(
          height: 170,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => CustomCategoryListViewItem(
              name: state.souvenirs[index].name,
              image:  state.souvenirs[index].image,
                  
            ),
            itemCount: state.souvenirs.length,
            scrollDirection: Axis.horizontal,
          ),
        );
        } else if (state is BazarSouvenirsFailure) {
        return  Center(
            child: Text(
              state.errMessage,
              style: AppTextStyles.poppins400style16,
            ),
          );
        }
        return CustomLoadingIndecatorHorizontalList(wideContainer: false);
      },
    );
  }
}


