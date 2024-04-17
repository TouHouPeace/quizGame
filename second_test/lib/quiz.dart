import 'package:flutter/material.dart';
import 'package:second_test/start_screen.dart';
import 'package:second_test/question_screen.dart';
import 'package:second_test/data/questions.dart';
import 'package:second_test/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState((){
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() { 
      selectedAnswers = [];
      activeScreen = 'start-screen';
      }
    );
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'questions-screen'){
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }

    if(activeScreen == 'results-screen'){
        screenWidget = ResultsScreen(restartQuiz, chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.green],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: screenWidget
        ),
      ),
    );
  }
}
