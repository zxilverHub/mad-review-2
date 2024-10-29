import 'package:flutter/material.dart';
import 'package:midterm_review/model/questions.dart';

class Result extends StatefulWidget {
  Result({super.key, required this.question, required this.userAnswer});

  final Question question;
  final String userAnswer;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  bool isCorrectAnswer() {
    return widget.question.answer == widget.userAnswer;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                width: 150,
                height: 150,
                isCorrectAnswer()
                    ? "./assets/icons/correct.png"
                    : "./assets/icons/wrong.png",
              ),
              const SizedBox(height: 12),
              Text(
                isCorrectAnswer()
                    ? "Correct answer!"
                    : "Correct answer is ${widget.question.answer}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
