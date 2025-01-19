import 'package:flutter/material.dart';
import 'package:quizapp/QuizScreen.dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz({super.key});

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('Quiz App',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600
      ),),
      centerTitle: true,
      backgroundColor: Colors.blue,
      )
      ,
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
            QuizScreen()));
          },
          child: const Text('Start Quiz'),
        ),
      ),
    );
  }
}