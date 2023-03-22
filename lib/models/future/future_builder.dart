import 'package:flutter/material.dart';

class FutureTest extends StatelessWidget {
  const FutureTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Completed with data ${snapshot.data}');
              } else if (snapshot.hasError) {
                return Text(
                  'There was an error',
                );
              } else {
                return Text(
                  'loading.....',
                );
              }
            }),
      ),
    );
  }

  Future<String> getData() {
    return Future.delayed(
        Duration(
          seconds: 5,
        ), () {
      throw Exception();
    });
  }
}
