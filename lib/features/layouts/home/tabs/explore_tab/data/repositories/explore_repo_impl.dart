import 'package:movies/features/layouts/home/tabs/explore_tab/data/data_sources/explore_data_source.dart';
import 'package:movies/features/layouts/home/tabs/explore_tab/data/models/genera_response.dart';
import 'package:movies/features/layouts/home/tabs/explore_tab/domain/repositories/explore_repo.dart';
import 'package:movies/features/shared/page_response.dart';

class ExploreRepoImpl extends ExploreRepo {
  ExploreDataSource exploreDS;
  ExploreRepoImpl(this.exploreDS);
  @override
  Future<GenreReponse> getGenre({int? page}) async{
    return await exploreDS.getGenre();
  }

  @override
  Future<PageResponse> getMovies({int? page, int? id}) async{
    return await exploreDS.getMovies(page: page, id: id);
  }
}
