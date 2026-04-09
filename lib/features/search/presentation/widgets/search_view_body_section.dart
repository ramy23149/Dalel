import 'package:dalel_app/core/functions/custom_navigation.dart';
import 'package:dalel_app/core/routes/app_router.dart';
import 'package:dalel_app/core/widgets/custom_category_list_view_item.dart';
import 'package:dalel_app/features/home/presentation/widgets/historical_period_item.dart';
import 'package:dalel_app/features/search/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBodySection extends StatelessWidget {
  const SearchViewBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
      //  final cubit = SearchCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              if (state.historicalCharactersList.isNotEmpty)
                SizedBox(
                  height: 170,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => CustomCategoryListViewItem(
                      name: state.historicalCharactersList[index].name,
                      image: state.historicalCharactersList[index].image!,
                      onTap: () => customPushNavigation(
                        AppRouter.kHistoricalCharacterDetailsView,
                        arguments: state.historicalCharactersList[index],
                      ),
                    ),
                    itemCount: state.historicalCharactersList.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
            if(state.historicalPeriodsList.isNotEmpty)
            SizedBox(
              height: 100,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.historicalPeriodsList.length,
                itemBuilder: (context, index) => HistoricalPeriodItem(
                  historicalPeriodsModel:
                      state.historicalPeriodsList[index],
                ),
              ),
            ),
          if(state.booksList.isNotEmpty)
          SizedBox(
                  height: 170,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => CustomCategoryListViewItem(
                      // onTap: () =>
                      //     cubit.lunchBookUrl(state.booksList[index].previewLink),
                      name: state.booksList[index].bookName,
                      image: state.booksList[index].bookImage!,
                    ),
                    itemCount: state.booksList.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
          if(state.isLoading == true)
          const Center(child: CircularProgressIndicator(),)
            ],
          ),
        );
      },
    );
  }
}
