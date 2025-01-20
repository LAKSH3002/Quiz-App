import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
// import 'package:quizapp/Colors.dart';
// import 'package:quizapp/QuizScreen.dart';
import 'package:quizapp/startquiz.dart';

class Instructionscreen extends StatefulWidget {
  const Instructionscreen({super.key});

  @override
  State<Instructionscreen> createState() => _InstructionscreenState();
}

class _InstructionscreenState extends State<Instructionscreen> {
  
  @override
  Widget build(BuildContext context) {
    // final screenwidth = MediaQuery.of(context).size.width;
    // final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      // App bar
      appBar: AppBar(
        title: const Text(
          'Quiz Instructions Page',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      // Body of App
      body: Container(
        child: Center(
          // Column to display cards in a column
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 8,),
              const Text(
              'Instructions/Guidelines:                       ',
              style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15,),
              InstructionsCard(' 1) This is a Miscellaneous Quiz App'),
              InstructionsCard(' 2) The Quiz has five questions.'),
              InstructionsCard(' 3) All Five Questions are compulsory.'),
              InstructionsCard(' 4) This Quiz Needs to attempted in one go.'),
              Container(
              height: 95,
              width: 340,
              child: const Card(
              elevation: 2,
              color: const Color.fromARGB(255, 248, 245, 245),
              shape: LinearBorder(),
              child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(' 5) Once You Select an answer, the answer will be considered final and you will be moved to the next question',
                style: const TextStyle(
                  color: Color.fromARGB(255, 95, 95, 3),
                fontSize: 17, 
                fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  ),
                ),
            ),
              ),
              ),
              InstructionsCard(' 6) After You Select the last Answer, Your results will be displayed'),
              InstructionsCard(' 7) Results will display score, correct and Incorrect Answers.'),
              const SizedBox(height: 20,),
              // Button to proceed to the quiz
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape:const RoundedRectangleBorder(),
                  elevation: 5
                ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                  const StartQuiz()));
                },
                child: const Text('Proceed to Quiz!!',
                style: TextStyle(fontSize: 20, letterSpacing: 1),
                ),
              ),  
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
// Card to display instructions of the quiz
Widget InstructionsCard(String title) 
{
  return Container(
    height: 65,
    width: 340,
    child: Card(
      elevation: 2,
      color: Color.fromARGB(255, 248, 245, 245),
      shape: LinearBorder(),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 10),
        child: Text(title,
          style: const TextStyle(
            color: Color.fromARGB(255, 95, 95, 3),
          fontSize: 17, 
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic),
        ),
      ),
    ),
  );
}
