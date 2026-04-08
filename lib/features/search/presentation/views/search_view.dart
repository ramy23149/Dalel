import 'package:dalel_app/core/services/service_locator.dart';
import 'package:dalel_app/features/search/data/repos/search_repo_impl.dart';
import 'package:dalel_app/features/search/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:dalel_app/features/search/presentation/widgets/custom_search_appbar_section.dart';
import 'package:dalel_app/features/search/presentation/widgets/recent_search_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(searchRepo: getIt.get<SearchRepoImpl>()),
      child: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          onVerticalDragStart: (details) => FocusScope.of(context).unfocus(),
          child: Scaffold(
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(height: 36),
                    CustomSearchAppBarSection(),
                    SizedBox(height: 16),
                    RecentSearchSectoin(),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
