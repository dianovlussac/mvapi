import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvapi/bloc/themebloc/theme_controller.dart';
import 'package:mvapi/repositories/movie_repository.dart';
import 'package:mvapi/widgets/home_screen_widgets/movie_list_horizontal.dart';
import '../../../bloc/nowplayingbloc/nowplaying_cubit.dart';
import '../movie_widgets_loader.dart';

class NowPlayingList extends StatelessWidget {
  const NowPlayingList(
      {Key? key, required this.themeController, required this.movieRepository})
      : super(key: key);
  final ThemeController themeController;
  final MovieRepository movieRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NowPlayingCubit(
        repository: context.read<MovieRepository>(),
      )..fetchList(),
      child: NowPlayingView(
        themeController: themeController,
        movieRepository: movieRepository,
      ),
    );
  }
}

class NowPlayingView extends StatelessWidget {
  const NowPlayingView(
      {Key? key, required this.themeController, required this.movieRepository})
      : super(key: key);
  final ThemeController themeController;
  final MovieRepository movieRepository;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<NowPlayingCubit>().state;
    switch (state.status) {
      case ListStatus.failure:
        return const Center(child: Text('Oops something went wrong!'));
      case ListStatus.success:
        if (state.movies.isEmpty) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: const <Widget>[
                    Text(
                      "No More Popular Movies",
                      style: TextStyle(color: Colors.black45),
                    )
                  ],
                )
              ],
            ),
          );
        } else {
          return MoviesListHorizontal(
            movies: state.movies,
            movieRepository: movieRepository,
            themeController: themeController,
          );
        }
      default:
        return buildMovielistLoaderWidget(context);
    }
  }
}
