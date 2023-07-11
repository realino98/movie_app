import 'package:flutter/material.dart';

class LearnMorePage extends StatelessWidget {
  const LearnMorePage({
    super.key,
    required this.movie_info,
    required this.backdrop,
  });
  final int movie_info;
  final String backdrop;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: 100,
        child: Image.network(
          backdrop,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
