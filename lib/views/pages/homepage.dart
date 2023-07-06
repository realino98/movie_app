import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../util/thumbnail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String apikey = '2e248ded257121ccbdf778c768b0774c';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZTI0OGRlZDI1NzEyMWNjYmRmNzc4Yzc2OGIwNzc0YyIsInN1YiI6IjY0YTY3NGQ2MmI1MzFkMDBjOWE3MGUzMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.uMopexDy9ekQPDfnCDemK9dK5yNA7MD-us1BuhrrMbo';
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    // print((trendingresult));
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 0.5,
      ),
      itemBuilder: (BuildContext context, int index) {
        //Videos
        // if (trendingmovies[index]['media_type'] != "tv") {
        return Thumbnail(
          title: trendingmovies[index]['title'],
          posterurl: 'https://image.tmdb.org/t/p/w500' +
              trendingmovies[index]['poster_path'],
        );
        // }
      },
    );
  }
}
