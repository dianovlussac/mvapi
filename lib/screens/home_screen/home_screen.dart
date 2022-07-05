import 'package:flutter/material.dart';
import 'package:mvapi/bloc/themebloc/theme_controller.dart';
import 'package:mvapi/repositories/movie_repository.dart';
import 'package:mvapi/widgets/home_screen_widgets/popularmovieswidgets/popularmovies_widget.dart';
import 'package:mvapi/widgets/home_screen_widgets/upcomingwidgets/upcoming_widget.dart';

import '../../widgets/home_screen_widgets/nowplayingwidgets/nowplaying_widget.dart';
import '../../widgets/home_screen_widgets/topratedmovieswidgets/toprated_movies_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {Key? key, required this.themeController, required this.movieRepository})
      : super(key: key);

  final ThemeController themeController;
  final MovieRepository movieRepository;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          UpComingWidget(
              movieRepository: widget.movieRepository,
              themeController: widget.themeController),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Now Playing"),
          ),
          NowPlayingWidget(
              movieRepository: widget.movieRepository,
              themeController: widget.themeController),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Popular Movies"),
          ),
          PopularMoviesWidget(
              movieRepository: widget.movieRepository,
              themeController: widget.themeController),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("AllTime Top Rated Movies"),
          ),
          TopRatedMoviesWidget(
              movieRepository: widget.movieRepository,
              themeController: widget.themeController)
        ],
      ),
    );
  }
}
