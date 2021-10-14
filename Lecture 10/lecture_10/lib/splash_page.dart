import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:lecture_10/chess_page.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Lottie.asset('assets/chess.json'),
            AnimatedButton(
              child: Text('Play'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChessPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
