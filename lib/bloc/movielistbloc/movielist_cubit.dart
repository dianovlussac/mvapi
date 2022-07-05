// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mvapi/model/movie.dart';
import 'package:mvapi/repositories/movie_repository.dart';
part 'movielist_state.dart';

class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit({required this.repository})
      : super(const MovieListState.loading());

  final MovieRepository repository;

  Future<void> fetchList() async {
    try {
      final movieResponse = await repository.getMovies(1);
      emit(MovieListState.success(movieResponse.movies));
    } on Exception {
      emit(const MovieListState.failure());
    }
  }
}
