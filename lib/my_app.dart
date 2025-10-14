import 'package:flutter/material.dart';

/// Entry point of the app
class MyApp extends StatelessWidget {
  /// Constructor for MyApp
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Colors App',
      debugShowCheckedModeBanner: false,
      home: Placeholder(),
    );
  }
}
