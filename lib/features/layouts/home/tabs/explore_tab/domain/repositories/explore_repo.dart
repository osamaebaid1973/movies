import 'package:movies/features/layouts/home/tabs/explore_tab/data/models/genera_response.dart';
import 'package:movies/features/shared/page_response.dart';

abstract class ExploreRepo {
  Future<PageResponse> getMovies({int? page, int? id});
  Future<GenreReponse> getGenre({int? page});
}
