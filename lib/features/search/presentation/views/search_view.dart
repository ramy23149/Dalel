import 'package:dalel_app/features/search/presentation/widgets/custom_search_appbar_section.dart';
import 'package:dalel_app/features/search/presentation/widgets/recent_search_section.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        onVerticalDragStart: (details) => FocusScope.of(context).unfocus(),
        child: Scaffold(
            body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: 36,
                  ),
                  CustomSearchAppBarSection(),
                  SizedBox(
                    height: 16,
                  ),
                  RecentSearchSectoin(),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
