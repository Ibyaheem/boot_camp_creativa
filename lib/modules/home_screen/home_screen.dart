import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List news = [];

  @override
  void initState() {
    print('data is processed');
    getData();
    // TODO: implement initState
    super.initState();
  }

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
