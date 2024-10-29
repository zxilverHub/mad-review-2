import 'package:flutter/material.dart';
import 'package:midterm_review/screens/quiz.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  void goToQuiz(int level) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Quiz(level: level),
      ),
    );
  }

  Widget getDiffeculty(int level) {
    return ElevatedButton(
      onPressed: () => goToQuiz(level),
      child: Text("Level ${level.toString()}"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Quiz level"),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getDiffeculty(1),
                getDiffeculty(2),
                getDiffeculty(3),
                getDiffeculty(4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
