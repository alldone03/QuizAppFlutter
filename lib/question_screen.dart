import 'package:flutter/material.dart';
import 'package:flutter_quizapp/question_list.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  final void Function(String answer) onSelectAnswer;
  const QuestionScreen({super.key, required this.onSelectAnswer});
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  nextquestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentquestion = questions[currentQuestionIndex];
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              currentquestion.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ...currentquestion.getShuffeltQuestion().map((e) {
            return ElevatedButton(
              onPressed: () {
                nextquestion(e);
              },
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 151, 27, 173)),
                elevation: MaterialStatePropertyAll(10),
              ),
              child: Text(e),
            );
          })
        ],
      ),
    );
  }
}
