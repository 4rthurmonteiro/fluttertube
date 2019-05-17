import 'package:fkuttertube/screens/home.dart';
import 'package:flutter/material.dart';

import 'api.dart';

void main() {

  Api api = Api();
  api.search("timao");

  runApp(MyApp());


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterTube',
      home: Home(),
    );
  }
}
