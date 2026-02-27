import "package:flutter/material.dart";
import "package:quiz_app/questions_screen.dart";
import "package:quiz_app/results_screen.dart";
import "start_screen.dart";
import "data/questions.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var currentScreen = "start-screen";
  List<String> selectedAnswers = [];


  void switchScreen() {
    setState(() {
      currentScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        currentScreen = "results-screen";
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (currentScreen == "questions-screen") {
     screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);  
    }
    else if(currentScreen == "results-screen") {
      screenWidget = ResultsScreen();
    }
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
          child: screenWidget,
        )
        ),
    );
  }
}