import 'package:flutter/material.dart';
import 'myhomepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SupaNotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 15, 15, 15)),
      ),
      home: const MyHomePage(title: 'Flutter SupaNotes'),
      debugShowCheckedModeBanner: false,
    );
  }
}
