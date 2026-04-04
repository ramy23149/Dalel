import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/custom_category_list_view_item.dart';
import 'package:dalel_app/core/widgets/custom_loading_indecator_horizontal_list.dart';
import 'package:dalel_app/features/bazar/presentation/cubits/bazar_books_cubit/bazar_books_cubit.dart';
import 'package:dalel_app/features/bazar/presentation/cubits/book_preveiw_cubit/book_preview_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalBooksSection extends StatelessWidget {
  const HistoricalBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BazarBooksCubit, BazarBooksState>(
      builder: (context, state) {
        
        if (state is BazarBooksLoadedSuccessfully) {
          return BlocBuilder<BookPreviewCubit, BookPreviewState>(
            builder: (context, _) {
            final cubit = BookPreviewCubit.get(context);
              return SizedBox(
                height: 170,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => CustomCategoryListViewItem(
                    onTap: () =>
                        cubit.lunchBookUrl(state.booksList[index].previewLink),
                    name: state.booksList[index].bookName,
                    image: state.booksList[index].bookImage!,
                  ),
                  itemCount: state.booksList.length,
                  scrollDirection: Axis.horizontal,
                ),
              );
            },
          );
        } else if (state is BazarBooksError) {
          return Center(
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
