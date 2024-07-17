import 'package:flutter/material.dart';
// import 'package:tic_tac/home_layout.dart';
import 'package:tic_tac/start_page.dart';

void main()
{
  return runApp(const TicTac());
}

class TicTac extends StatelessWidget {
  const TicTac({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StartPage() ,
      debugShowCheckedModeBanner: false,
    );
  }
}