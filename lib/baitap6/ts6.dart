import 'package:lesson6/baitap6/ts5.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lession06',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductList(),
    );
  }
}
