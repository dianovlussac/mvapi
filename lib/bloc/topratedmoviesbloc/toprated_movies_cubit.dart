import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mvapi/model/movie.dart';
import 'package:mvapi/repositories/movie_repository.dart';
part 'toprated_movies_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit({required this.repository})
      : super(const TopRatedState.loading());

  final MovieRepository repository;

  Future<void> fetchTopRated() async {
    try {
      final movieResponse = await repository.getTopRatedMovies();
      emit(TopRatedState.success(movieResponse.movies));
    } on Exception {
      emit(const TopRatedState.failure());
    }
  }
}
