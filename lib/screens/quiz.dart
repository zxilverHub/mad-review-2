import 'package:flutter/material.dart';
import 'package:midterm_review/model/questionsList.dart';
import 'package:midterm_review/screens/result.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key, required this.level});

  final int level;

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final questons = QUESTIONS;

  var answerController = TextEditingController();

  void checkAnswer(String answer) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Result(
          question: questons[widget.level - 1],
          userAnswer: answer,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Quiz level ${widget.level}"),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(questons[widget.level - 1].question),
              const SizedBox(height: 12),
              TextField(
                controller: answerController,
                obscureText: false,
                decoration: const InputDecoration(
                  label: Text("Answer"),
                  hintText: "Answer",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        checkAnswer(answerController.text);
                      },
                      child: Text("Submit"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
