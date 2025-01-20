import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quizapp/InstructionScreen.dart';
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
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.w600
        ),),
      iconTheme: const IconThemeData(
          color: Colors.white
        ),
      centerTitle: true,
      backgroundColor: Colors.green,
      )
      ,
      body: Center(
        child: Column(
          children: [

            const SizedBox(height: 100,),
        
            Image.asset('images/question.png', height: 280),
        
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape:BeveledRectangleBorder()
              ),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                Instructionscreen()));
              },
              child: const Text('Start Quiz Now!!',
              style: TextStyle(fontSize: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}