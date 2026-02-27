import "package:flutter/material.dart";

class AnswerButton extends StatelessWidget {
  final String buttonText;
  final void Function() onTap;

  const AnswerButton({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(context) {
    return ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 42, 10, 97),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40)
            ), 
            child: Text(buttonText, textAlign: TextAlign.center,)
          );
  }
}