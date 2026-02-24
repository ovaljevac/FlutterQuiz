import "package:flutter/material.dart";
import "package:quiz_app/data/questions.dart";

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "The question..."
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {}, 
            child: Text(
              "Answer 1",
            )
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {}, 
            child: Text(
              "Answer 2",
            )
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {}, 
            child: Text(
              "Answer 3",
            )
          )
        ],
      ),
    );
  }
}