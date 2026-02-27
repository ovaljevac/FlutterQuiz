import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class StartScreen extends StatelessWidget {
  final void Function() startQuiz;

  const StartScreen(this.startQuiz ,{super.key});

  @override
  Widget build(context) {
    return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 80),
                  child: Image.asset(
                    "assets/images/quiz-logo.png", 
                    height: 300,
                    color: const Color.fromARGB(157, 255, 255, 255) 
                    ),
                ),
                Text(
                  "Learn flutter the fun way", 
                  style: GoogleFonts.lato(
                    color: Colors.white, 
                    fontSize: 28,
                    ),
                ),
                const SizedBox(height: 30),
                OutlinedButton.icon(
                  onPressed: startQuiz, 
                  icon: const Icon(Icons.arrow_right_alt),
                  label: const Text(
                    "Start quiz", 
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 14
                    )
                  ),
                )
              ],
            )
            );
  }
}