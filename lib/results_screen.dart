import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "data/questions.dart";
import "question_summary.dart";

class ResultsScreen extends StatelessWidget{
  final List<String> chosenAnswers;
  
  const ResultsScreen({super.key, required this.chosenAnswers, required this.onRestartQuiz});

  final void Function() onRestartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for(var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].questionText,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i]
      });
    }
    return summary;
  }


  @override
  Widget build(context) {
    final numTotalQuesitions = questions.length;
    List<int> correctIndex = [];
    final numCorrectQuestions = summaryData.where((item) {
      if(item["correct_answer"] == item["user_answer"]) {
        correctIndex.add(item["question_index"] as int);
        return true;
      }
      return false;
    }).length;


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered $numCorrectQuestions out of $numTotalQuesitions questions correctly!",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(206, 255, 255, 255),
                fontSize: 24,
              )),
            SizedBox(height: 30,),
            QuestionSummary(summaryData, correctIndex),
            SizedBox(height: 30,),
            TextButton(
              onPressed: () {
                onRestartQuiz();
              },
              child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.restart_alt,
                  color: const Color.fromARGB(224, 255, 255, 255)
                ),
                SizedBox(width: 8),
                Text("Restart Quiz!",
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(224, 255, 255, 255),
                    fontSize: 20
                  ),
                  ),
              ],
            ),
          )
          ],
        )
      )
    );
  }
}