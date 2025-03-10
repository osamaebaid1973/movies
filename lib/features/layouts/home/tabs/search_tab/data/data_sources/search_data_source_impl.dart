import 'dart:convert';

import 'package:movies/core/helpers/api_helper.dart';
import 'package:movies/features/layouts/home/tabs/search_tab/data/data_sources/search_data_source.dart';
import 'package:movies/features/shared/page_response.dart';

class SearchDataSourceImpl extends SearchDataSource {
  ApiHelper apiHelper;

  SearchDataSourceImpl({required this.apiHelper});
  @override
  Future<PageResponse> searchMovies(String query) async {
    try {
      var response = await apiHelper.getRequest("/3/search/movie", query: {"query": query});
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return PageResponse.fromJson(jsonResponse);
    } catch (e) {
      throw Exception('Failed to search movies');
    }
  }
}
