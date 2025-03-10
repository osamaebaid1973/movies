import 'dart:convert';

import 'package:movies/core/helpers/api_helper.dart';
import 'package:movies/features/layouts/home/tabs/explore_tab/data/data_sources/explore_data_source.dart';
import 'package:movies/features/layouts/home/tabs/explore_tab/data/models/genera_response.dart';
import 'package:movies/features/shared/page_response.dart';

class ExploreDataSourceImpl extends ExploreDataSource {
  final ApiHelper apiHelper;

  ExploreDataSourceImpl(this.apiHelper);
  @override
  Future<GenreReponse> getGenre() async {
    try {
      var response = await apiHelper.getRequest('/3/genre/movie/list');
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return GenreReponse.fromJson(jsonResponse);
    } catch (e) {
      throw Exception('Failed to get genres');
    }
  }

  @override
  Future<PageResponse> getMovies({int? page, int? id}) async {
    try {
      var response = await apiHelper.getRequest(
        "/3/discover/movie",
        query: {
          'include_adult': 'false',
          'include_video': 'false',
          'language': 'en-US',
          'page': page?.toString() ?? '1', // Default to 1 if null
          'sort_by': 'popularity.desc',
          'with_genres':
              id?.toString() ?? '', // Empty if null, adjust as needed
        },
      );
     if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return PageResponse.fromJson(jsonResponse);
      } else {
        throw Exception(
            'Failed to get movies: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to get movies: $e');
    }
  }
}
