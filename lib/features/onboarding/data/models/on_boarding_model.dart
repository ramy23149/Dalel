import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_strings.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String description;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.description,
  });

    static final List<OnBoardingModel> onBoardingDataList = [
    OnBoardingModel(
      image: Assets.imagesOnbording1,
      title: AppStrings.Explore_The_history_with_Dalel_in_a_smart_way,
      description: AppStrings
          .Using_our_apps_history_libraries_you_can_find_many_historical_periods,
    ),
    OnBoardingModel(
      image: Assets.imagesOnbording2,
      title: AppStrings.From_every_place_on_earth,
      description:
          AppStrings.A_big_variety_of_ancient_places_from_all_over_the_world,
    ),
    OnBoardingModel(
      image: Assets.imagesOnbording3,
      title: AppStrings.Using_modern_AI_technology_for_better_user_experience,
      description: AppStrings
          .AI_provide_recommendations_and_helps_you_to_continue_the_search_journey,
    ),
  ];
}