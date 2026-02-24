import "package:flutter/material.dart";
import "package:quiz_app/questions_screen.dart";
import "start_screen.dart";


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var currentScreen = "start-screen";

  void switchScreen() {
    setState(() {
      currentScreen = "questions-screen";
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.deepPurple, Colors.indigo],
            ),
          ),
          child: currentScreen == "start-screen" ? StartScreen(switchScreen) : const QuestionsScreen(),
        )
        ),
    );
  }
}