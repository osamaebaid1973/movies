import 'package:movies/features/shared/page_response.dart';

abstract class SearchDataSource {
  Future<PageResponse> searchMovies(String query);
}