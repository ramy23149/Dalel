import 'package:dalel_app/core/functions/show_flutter_toast.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

part 'book_preview_state.dart';

class BookPreviewCubit extends Cubit<BookPreviewState> {
  BookPreviewCubit() : super(BookPreviewInitial());
  static BookPreviewCubit get(context) => BlocProvider.of(context);

    Future<void> lunchBookUrl(String? url) async {
    emit(BookPreviewLoading());
    if (url != null) {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } else {
      showFlutterToast(message: AppStrings.sorry_can_not_open_this_book);
    }
    emit(BookPreviewLoaded());
  }
}
