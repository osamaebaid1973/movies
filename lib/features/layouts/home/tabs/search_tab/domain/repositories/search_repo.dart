import 'package:movies/features/shared/page_response.dart';

abstract class SearchRepo {
  Future<PageResponse> searchMovies(String query);
}
