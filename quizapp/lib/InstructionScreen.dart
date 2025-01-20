import 'package:flutter/material.dart';
import 'package:quizapp/QuizScreen.dart';

class Instructionscreen extends StatefulWidget {
  const Instructionscreen({super.key});

  @override
  State<Instructionscreen> createState() => _InstructionscreenState();
}

class _InstructionscreenState extends State<Instructionscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz Instructions',
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            InstructionsCard(' 1) This Quiz has five questions.'),
            InstructionsCard(' 2) All Five Questions are compulsory.'),
            InstructionsCard(' 3) This Quiz Needs to attempted in one go.'),
            Container(
        height: 100,
        width: 500,
        child: const Card(
          elevation: 2,
          color: const Color.fromARGB(255, 234, 221, 221),
          shape: LinearBorder(),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(' 4) Once You Select an answer, the answer will be considered final and you will be moved to the next question',
              style: const TextStyle(
                color: Color.fromARGB(255, 95, 95, 3),
              fontSize: 18, 
              fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic),
              ),
          ),
            ),
            ),
            InstructionsCard(' 5) After You Select the last Answer, Your results will be displayed'),
            InstructionsCard(' 6) Results will display score, correct and Incorrect Answers.'),
            const SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape:BeveledRectangleBorder()
              ),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                QuizScreen()));
              },
              child: const Text('Proceed to Quiz!!',
              style: TextStyle(fontSize: 25),
              ),
            ),  
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget InstructionsCard(String title) 
{
  return Container(
    height: 70,
    width: 500,
    child: Card(
      elevation: 2,
      color: Color.fromARGB(255, 234, 221, 221),
      shape: LinearBorder(),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 10),
        child: Text(title,
          style: const TextStyle(
            color: Color.fromARGB(255, 95, 95, 3),
          fontSize: 18, 
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic),
        ),
      ),
    ),
  );
}
