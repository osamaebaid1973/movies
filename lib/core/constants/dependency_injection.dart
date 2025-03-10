//import 'package:get_it/get_it.dart' as di;
import 'package:get_it/get_it.dart';
import 'package:movies/core/helpers/api_helper.dart';
import 'package:movies/features/layouts/home/tabs/explore_tab/data/data_sources/explore_data_source.dart';
import 'package:movies/features/layouts/home/tabs/explore_tab/data/data_sources/explore_data_source_impl.dart';
import 'package:movies/features/layouts/home/tabs/explore_tab/data/repositories/explore_repo_impl.dart';
import 'package:movies/features/layouts/home/tabs/explore_tab/domain/repositories/explore_repo.dart';
import 'package:movies/features/layouts/home/tabs/explore_tab/presentation/bloc/explore_cubit.dart';
import 'package:movies/features/layouts/home/tabs/search_tab/data/data_sources/search_data_source.dart';
import 'package:movies/features/layouts/home/tabs/search_tab/data/data_sources/search_data_source_impl.dart';
import 'package:movies/features/layouts/home/tabs/search_tab/data/repositories/search_repo_impl.dart';
import 'package:movies/features/layouts/home/tabs/search_tab/domain/repositories/search_repo.dart';
import 'package:movies/features/layouts/home/tabs/search_tab/presentation/bloc/search_cubit.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  //ApiHelper Singleton
  serviceLocator.registerSingleton<ApiHelper>(ApiHelper());
  //Search Factory Methods
  serviceLocator.registerFactory<SearchDataSource>(
      () => SearchDataSourceImpl(apiHelper: serviceLocator<ApiHelper>()));
  serviceLocator.registerFactory<SearchRepo>(() =>
      SearchRepoImpl(searchDataSource: serviceLocator<SearchDataSource>()));
  serviceLocator
      .registerFactory(() => SearchCubit(serviceLocator<SearchRepo>()));

  //Explore Factory Methods  
  serviceLocator.registerFactory<ExploreDataSource>(
      () => ExploreDataSourceImpl(serviceLocator<ApiHelper>()));
  serviceLocator.registerFactory<ExploreRepo>(() =>
      ExploreRepoImpl(serviceLocator<ExploreDataSource>()));
  serviceLocator
      .registerFactory(() => ExploreCubit(serviceLocator<ExploreRepo>()));
}
