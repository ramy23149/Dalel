import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/features/search/presentation/widgets/custom_recent_search_item.dart';
import 'package:flutter/material.dart';

class RecentSearchSectoin extends StatelessWidget {
  const RecentSearchSectoin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.Recent,
            style: AppTextStyles.poppins600style12.copyWith(
              color: AppColors.deepGrey
            ),
          ),
          SizedBox(
            height: 16,
          ),
          CustomRecentSearchItem(),
        ],
      ),
    );
  }
}

