//import 'package:get_it/get_it.dart' as di;
import 'package:get_it/get_it.dart';
import 'package:movies/core/helpers/api_helper.dart';
import 'package:movies/features/layouts/home/tabs/search_tab/data/data_sources/search_data_source.dart';
import 'package:movies/features/layouts/home/tabs/search_tab/data/data_sources/search_data_source_impl.dart';
import 'package:movies/features/layouts/home/tabs/search_tab/data/repositories/search_repo_impl.dart';
import 'package:movies/features/layouts/home/tabs/search_tab/domain/repositories/search_repo.dart';
import 'package:movies/features/layouts/home/tabs/search_tab/presentation/bloc/search_cubit.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
 /*  serviceLocator.registerSingleton<ApiHelper>(ApiHelper());
  serviceLocator.registerFactory<SearchDataSource>(() => SearchDataSourceImpl(apiHelper: serviceLocator.get<ApiHelper>()));
  serviceLocator.registerFactory<SearchRepo>(() => SearchRepoImpl(searchDataSource: serviceLocator.get<SearchDataSource>()));
  serviceLocator.registerFactory(()=> SearchCubit(serviceLocator.get<SearchRepo>())); */
  serviceLocator.registerSingleton<ApiHelper>(ApiHelper());
  serviceLocator.registerFactory<SearchDataSource>(
      () => SearchDataSourceImpl(apiHelper: serviceLocator<ApiHelper>()));
  serviceLocator.registerFactory<SearchRepo>(() =>
      SearchRepoImpl(searchDataSource: serviceLocator<SearchDataSource>()));
  serviceLocator
      .registerFactory(() => SearchCubit(serviceLocator<SearchRepo>()));
}
