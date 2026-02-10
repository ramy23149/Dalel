import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<SharedPrefHelper>(SharedPrefHelper());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
}
