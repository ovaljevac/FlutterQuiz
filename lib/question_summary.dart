import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class QuestionSummary extends StatelessWidget {

  final List<Map<String, Object>> summaryData;
  final List<int> correctIndex;
  const QuestionSummary(this.summaryData, this.correctIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: correctIndex.contains(data["question_index"]) ? Color.fromARGB(165, 105, 240, 175) : const Color.fromARGB(161, 239, 103, 93),
                    shape: BoxShape.circle
                  ),
                  child: Text((
                    (data["question_index"] as int) + 1).toString(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      color: const Color.fromARGB(172, 0, 0, 0),
                      fontSize: 16
                    )
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(data["question"] as String,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(data["user_answer"] as String,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(185, 158, 158, 158)
                      )
                    ),
                    Text(data["correct_answer"] as String,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(165, 105, 240, 175)
                      )
                    )
                  ],),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}