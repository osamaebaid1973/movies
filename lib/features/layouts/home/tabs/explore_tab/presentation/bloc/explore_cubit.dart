import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/layouts/home/tabs/explore_tab/data/models/genera_response.dart';
import 'package:movies/features/layouts/home/tabs/explore_tab/domain/repositories/explore_repo.dart';
import 'package:movies/features/layouts/home/tabs/explore_tab/presentation/bloc/explore_states.dart';
import 'package:movies/features/shared/results.dart';

class ExploreCubit extends Cubit<ExploreStates> {
  List<Results>? loadedMovies = [];
  List<Genres>? genres;
  bool isFetching = false; // <-- flag to prevent multiple calls
  int currentIndex = 0;
  int currentPage = 1;
  bool hasMorePages = true;
  ExploreRepo exploreRepo;
  ExploreCubit(this.exploreRepo)
      : super(ExploreInitState());
  static ExploreCubit get(context) => BlocProvider.of(context);

  void changeGenre(int isSelected) async {
    currentIndex = isSelected;
    await getMovie();
    emit(ChangeGenre());
  }

  Future<void> getMovie({int? page}) async {
    // Prevent multiple calls if already fetching
    if (isFetching) return;
    isFetching = true;

    try {
      if (page == null || page == 1) {
        currentPage = 1;
        hasMorePages = true;
        loadedMovies?.clear(); // clear accumulated list for new fetch (or genre change)
        emit(ExploreLoadingState());
        // Fetch genres only once (or on refresh)
       if (genres == null) {
          final genreResponse = await exploreRepo.getGenre();
          genres = genreResponse.genres; // Store the genre list
        }
      } else {
        currentPage = page;
      }

      final genreId = genres?[currentIndex].id; // Assumes genres is non-null after first fetch
      final pageResponse = await exploreRepo.getMovies(
        page: currentPage,
        id: genreId,
      );

        
       if (pageResponse.results != null) {
        if (currentPage == 1) {
          loadedMovies = pageResponse.results!;
        } else {
          loadedMovies?.addAll(pageResponse.results!);
        }
        // Check if we've reached the last page
        if (currentPage >= (pageResponse.totalPages ?? 1)) {
          hasMorePages = false;
        }
        emit(ExploreSuccessState());
      } else {
        emit(ExploreErrorState("Something went wrong"));
      }
    } catch (e) {
       emit(ExploreErrorState(e.toString()));
    } finally {
      isFetching = false;
    }
  }
}
