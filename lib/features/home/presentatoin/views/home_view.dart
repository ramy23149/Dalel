import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_header_text.dart';
import 'package:dalel_app/features/home/presentatoin/widgets/custom_home_view_appBar.dart';
import 'package:dalel_app/features/home/presentatoin/widgets/historical_periods_section.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(height: 78),
              CustomHomeViewAppBar(),
              SizedBox(height: 32),
              HistoricalPeriodsSection(),
              SizedBox(height: 32),
              HistoricalCharactersSection(),
            ]))
          ],
        ),
      ),
    );
  }
}

class HistoricalCharactersSection extends StatelessWidget {
  const HistoricalCharactersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeaderText(text: AppStrings.historical_characters),
      ],
    );
  }
}
