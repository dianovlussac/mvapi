// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mvapi/model/cast.dart';
import 'package:mvapi/repositories/movie_repository.dart';
part 'moviecasts_state.dart';

class MovieCastsCubit extends Cubit<MovieCastsState> {
  MovieCastsCubit({required this.repository})
      : super(const MovieCastsState.loading());

  final MovieRepository repository;

  Future<void> fetchCasts(int movieId) async {
    try {
      final movieResponse = await repository.getCasts(movieId);
      emit(MovieCastsState.success(movieResponse.casts));
    } on Exception {
      emit(const MovieCastsState.failure());
    }
  }
}
