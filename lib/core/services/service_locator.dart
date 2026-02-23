import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/features/home/data/data_source/remote_data_source.dart';
import 'package:dalel_app/features/home/data/repos/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<SharedPrefHelper>(SharedPrefHelper());
  getIt.registerSingleton<HomeRemoteDataSource>(HomeRemoteDataSourceImpl());
  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(homeRemoteDataSource: getIt.get<HomeRemoteDataSource>()));
}
