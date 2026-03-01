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
  var _currentScreen = "start-screen";
  List<String> _selectedAnswers = [];


  void _switchScreen() {
    setState(() {
      _currentScreen = "questions-screen";
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);
    if(_selectedAnswers.length == questions.length) {
      setState(() {
        _currentScreen = "results-screen";
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      _currentScreen = "start-screen";
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(_switchScreen);
    if (_currentScreen == "questions-screen") {
     screenWidget = QuestionsScreen(onSelectAnswer: _chooseAnswer);  
    }
    else if(_currentScreen == "results-screen") {
      screenWidget = ResultsScreen(chosenAnswers: _selectedAnswers, onRestartQuiz: _restartQuiz,);
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