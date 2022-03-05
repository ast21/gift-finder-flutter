import 'package:flutter/material.dart';
import 'package:gift_finder/finder.dart';
import 'package:gift_finder/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/finder': (context) => const Finder(),
      },
      title: 'Gift Finder',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: const Color.fromRGBO(216, 22, 22, 1)),
          toggleableActiveColor: const Color.fromRGBO(216, 22, 22, 1)),
      home: const Intro(),
    );
  }
}
