import 'package:flutter/material.dart';
import 'package:second_test/data/questions.dart';
import 'package:second_test/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.onRestart, {super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for(var i = 0; i < chosenAnswers.length; i++){
      summary.add(
        {
        'question_index' : i,
        'question' : questions[i].text,
        'correct_answer' : questions[i].answers[0],
        'user_answer' : chosenAnswers[i]
        }
      );
    }

    return summary;
  }

  @override

  Widget build(BuildContext context) {

    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('在$numTotalQuestions个老婆中，你正确的宠幸了$numCorrectQuestions个！'),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30,),

            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.deepPurple,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('重新翻！')
            ),
          ],
        ),
      ),
    );
  }
}
