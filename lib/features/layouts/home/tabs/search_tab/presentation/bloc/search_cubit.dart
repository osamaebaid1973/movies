import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/layouts/home/tabs/search_tab/domain/repositories/search_repo.dart';
import 'package:movies/features/layouts/home/tabs/search_tab/presentation/bloc/search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  String lastQuery = '';
  SearchRepo searchRepo;
  SearchCubit(this.searchRepo) : super(SearchInitState());

  void maybePerformSearch(String newQuery) async {
    final currentQuery = newQuery.trim();

    if (currentQuery.isEmpty) {
      lastQuery = '';
      emit(EmptySearchState());
      return;
    }
    if (currentQuery == lastQuery) return;

    lastQuery = currentQuery;
    await getSearch(currentQuery);
  }

  Future<void> getSearch(String query) async {
    try {
      emit(SearchLoadingState());
     var result = await searchRepo.searchMovies(query);

    if (result.results == null || result.results!.isEmpty) {
        emit(EmptySearchState());
        return;
      } else if (result.results != null) {
        emit(SearchSuccessState(result));
      } else {
        emit(SearchErrorState(result.statusMessage ?? 'Somthing went wrong'));
      }
    } catch (e) {
      emit(SearchErrorState(e.toString()));
    }
  }
}
