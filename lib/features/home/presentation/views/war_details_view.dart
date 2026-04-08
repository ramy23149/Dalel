import 'package:dalel_app/core/services/service_locator.dart';
import 'package:dalel_app/features/home/data/models/war_model/war_model.dart';
import 'package:dalel_app/features/home/data/repos/home_repo_impl.dart';
import 'package:dalel_app/features/home/presentation/cubits/wars_cubit/wars_cubit.dart';
import 'package:dalel_app/features/home/presentation/widgets/custom_home_view_appBar.dart';
import 'package:dalel_app/features/home/presentation/widgets/war_details_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WarDetailsView extends StatelessWidget {
  const WarDetailsView({super.key, required this.warModel});
  final WarModel warModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WarsCubit(homeRepo: getIt.get<HomeRepoImpl>()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 72),
                  CustomHomeViewAppBar(),
                  SizedBox(height: 7),
                  WarDetailsSection(warModel: warModel),
                  SizedBox(height: 22),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
