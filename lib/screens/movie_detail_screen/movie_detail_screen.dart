import 'package:flutter/material.dart';
import 'package:mvapi/bloc/themebloc/theme_controller.dart';
import 'package:mvapi/repositories/movie_repository.dart';
import 'package:mvapi/widgets/movie_detail_widgets/moviedetail_widget.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen(
      {Key? key,
      required this.movieId,
      required this.themeController,
      required this.movieRepository})
      : super(key: key);
  final ThemeController themeController;
  final MovieRepository movieRepository;
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return MovieDetailWidget(
      movieId: movieId,
      movieRepository: movieRepository,
      themeController: themeController,
    );
  }
}
