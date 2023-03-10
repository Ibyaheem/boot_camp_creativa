import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    print('data is processed');
    getData();
    // loadMovies();

    // TODO: implement initState
    super.initState();
  }

  List news = [];
  // List trendingMovies = [];
  // List topMovies = [];
  // List tv = [];
  // final String key = '13ecc04195922b63e3c0bcab24e394e4';
  // final String token =
  //     'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxM2VjYzA0MTk1OTIyYjYzZTNjMGJjYWIyNGUzOTRlNCIsInN1YiI6IjY0MDVlNjE3MDIxY2VlMDA4NDcxZTM4NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.A_wmnjKbztLTqnSKnCupli6i_7PJvIYh2-QczQ7nS3M';
  //
  // loadMovies() async {
  //   var response = await http.get(
  //     Uri.parse(
  //         " https://api.themoviedb.org/3/movie/550?api_key=13ecc04195922b63e3c0bcab24e394e4"),
  //   );
  //   print(response.statusCode);
  //   print(response);
  //   print(response.body);
  //
  //   TMDB tmdbWithCustomLogs = TMDB(
  //     ApiKeys(key, token),
  //     logConfig: ConfigLogger(
  //       showLogs: true,
  //       showErrorLogs: true,
  //     ),
  //   );
  //
  //   Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
  //   Map topResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
  //   Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();
  //
  //   setState(() {
  //     trendingMovies = trendingResult['results'];
  //     topMovies = topResult['results'];
  //     tv = tvResult['results'];
  //   });
  //   print(trendingMovies);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: news.isEmpty
              ? CircularProgressIndicator()
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return Container(
                      color: Colors.black,
                      height: 1.0,
                      width: double.infinity,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Text(
                      news[index],
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                  itemCount: news.length,
                ),
        ),
      ),
    );
  }

  getData() async {
    var response = await http.get(
      Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=eg&apiKey=896b9833d529428aa5ba6e2509191a7e"),
    );
    print(response.statusCode);
    print(response);
    var data = jsonDecode(response.body);
    var dataList = data['articles'];
    setState(() {
      for (var item in dataList) {
        String title = item['title'];
        news.add(title);
      }
    });
  }

// GET DATA NEWS API
}

//Inherited Widget to pass data between screens or a multiple widgets like (Tree)

// class InheritedNose extends InheritedWidget {
//   InheritedNose({required super.child});
//
//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//     // TODO: implement updateShouldNotify
//     throw UnimplementedError();
//   }
//
// }
