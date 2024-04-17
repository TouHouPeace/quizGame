import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset('assets/images/quiz-logo.png', width: 300, color:const Color.fromARGB(150, 255, 255, 255)),
        const SizedBox(height: 80),
        const Text(
          '来后宫一起翻牌子吧!',
          style: TextStyle(
            color: Colors.purple,
            fontSize: 35,
          ),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.purple),
            icon: const Icon(Icons.arrow_right_alt), 
            label: Text(
              '开翻!',
              style: GoogleFonts.lato(fontSize: 20),
            ))
      ]),
    );
  }
}
