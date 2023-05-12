import 'package:flutter/material.dart';
import 'package:flutter_quizapp/question_list.dart';
import 'package:flutter_quizapp/question_screen.dart';
import 'package:flutter_quizapp/result_screen.dart';
import 'package:flutter_quizapp/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  Widget? stateScreen;

  @override
  void initState() {
    super.initState();
    stateScreen = StartScreen(
      changeddata,
    );
  }

  changeddata() {
    setState(() {
      if (selectedAnswer.length == questions.length) {
        selectedAnswer.clear();
        stateScreen = QuestionScreen(
          onSelectAnswer: addAnswer,
        );
      } else {
        stateScreen = QuestionScreen(
          onSelectAnswer: addAnswer,
        );
      }
    });
  }

  addAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        stateScreen = ResultScreen(
          chosenAnswers: selectedAnswer,
          changedata: changeddata,
        );
      });
    }
    // print(selectedAnswer);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      // color: const Color(0xff480092),
      child: SafeArea(child: stateScreen!),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff490090), Color(0xff5e0093)])),
    )));
  }
}
