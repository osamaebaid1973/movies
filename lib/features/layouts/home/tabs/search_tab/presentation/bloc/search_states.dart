import 'package:movies/features/shared/page_response.dart';

abstract class SearchStates {}

class SearchInitState extends SearchStates {}

class EmptySearchState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {
  PageResponse? searchResponse;
  SearchSuccessState(this.searchResponse);
}

class SearchErrorState extends SearchStates {
  String error;
  SearchErrorState(this.error);
}
