import 'package:flutter/material.dart';
import 'package:mvapi/bloc/themebloc/theme_service.dart';
import 'app.dart';
import 'bloc/themebloc/theme_controller.dart';
import 'repositories/movie_repository.dart';

void main() async {
  final movieRepository = MovieRepository();
  final themeController = ThemeController(ThemeService());
  await themeController.loadSettings();
  runApp(App(
    themeController: themeController,
    movieRepository: movieRepository,
  ));
}
