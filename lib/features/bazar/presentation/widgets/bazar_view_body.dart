import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/core/widgets/custom_historical_periods_list_view.dart';
import 'package:dalel_app/features/bazar/presentation/widgets/histoical_souvenirs_section.dart';
import 'package:dalel_app/features/bazar/presentation/widgets/historical_books_section.dart';
import 'package:flutter/material.dart';

class BazarViewBody extends StatelessWidget {
  const BazarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(height: 12),
            Text(
              AppStrings.Bazar,
              style: AppTextStyles.poppins700style20,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            CustomHeaderText(text: AppStrings.History_Books),
            SizedBox(height: 20),
            CustomHistoricalPeriodsListView(),
            SizedBox(height: 32),
            CustomHeaderText(text: AppStrings.History_Books),
            SizedBox(height: 16),
            HistoricalBooksSection(),
            SizedBox(height: 32),
            CustomHeaderText(text: AppStrings.Historical_Souvenirs),
            SizedBox(height: 16),
            HistoricalSouvenirsSection(),
            SizedBox(height: 100),
          ]),
        ),
      ],
    );
  }
}
