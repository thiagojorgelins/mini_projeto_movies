import 'package:flutter/material.dart';

class RentalMovies extends StatefulWidget {
  const new({super.key});

  @override
  State<RentalMovies> createState() => _RentalMoviesState();
}

class _RentalMoviesState extends State<RentalMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Filmes alugados")
        ],
      ),
    );
  }
}