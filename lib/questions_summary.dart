import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(children: [
              Container(
                decoration: BoxDecoration(
                  color: (data['correct_answer'] == data['user_answer'])
                      ? const Color(0xff7ebff9)
                      : const Color(0xfffb69fa),
                  shape: BoxShape.circle,
                ),
                height: 30,
                width: 30,
                child: Center(
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 96, 22, 109),
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data['correct_answer'] as String,
                      style: const TextStyle(
                          color: Color(0xff7ebff9), fontSize: 12),
                    ),
                    Text(
                      data['user_answer'] as String,
                      style: const TextStyle(
                          color: Color(0xfffb69fa), fontSize: 12),
                    ),
                  ],
                ),
              )
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
