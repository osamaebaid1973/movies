import 'package:movies/features/layouts/home/tabs/search_tab/data/data_sources/search_data_source.dart';
import 'package:movies/features/layouts/home/tabs/search_tab/domain/repositories/search_repo.dart';
import 'package:movies/features/shared/page_response.dart';

class SearchRepoImpl extends SearchRepo {
  SearchDataSource searchDataSource;

  SearchRepoImpl({required this.searchDataSource});

  @override
  Future<PageResponse> searchMovies(String query) async {
    return await searchDataSource.searchMovies(query);
  }
}
