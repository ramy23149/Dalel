import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/core/utils/api_serviece.dart';
import 'package:dalel_app/features/auth/data/login_repo_impl.dart';
import 'package:dalel_app/features/bazar/data/data_sources/bazar_remote_data_source.dart';
import 'package:dalel_app/features/bazar/data/repos/bazar_repo_impl.dart';
import 'package:dalel_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:dalel_app/features/home/data/repos/home_repo_impl.dart';
import 'package:dalel_app/features/search/data/data_source/search_remote_data_source.dart';
import 'package:dalel_app/features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<SharedPrefHelper>(SharedPrefHelper());
  getIt.registerSingleton<HomeRemoteDataSource>(HomeRemoteDataSourceImpl());
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(homeRemoteDataSource: getIt.get<HomeRemoteDataSource>()),
  );
  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl());

  getIt.registerSingleton<ApiServiece>(ApiServiece(Dio()));

  getIt.registerSingleton<BazarBooksRemoteDataSourceImpl>(
    BazarBooksRemoteDataSourceImpl(getIt.get<ApiServiece>()),
  );

  getIt.registerSingleton<BazarRepoImpl>(
    BazarRepoImpl(
      bazarRemoteDataSource: getIt.get<BazarBooksRemoteDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<SearchRemoteDataSource>(
    SearchRemoteDataSourceImpl(
      apiServiece: getIt.get<ApiServiece>(),
      firestore: FirebaseFirestore.instance,
    ),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(searchRemoteDataSource: getIt.get<SearchRemoteDataSource>()),
  );
}
