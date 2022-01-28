import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api/src/page/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
