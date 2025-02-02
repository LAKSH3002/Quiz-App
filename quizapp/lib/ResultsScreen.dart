import 'package:flutter/material.dart';
import 'package:quizapp/model/QuizQuestion.dart';
import 'package:quizapp/startquiz.dart';

class Resultsscreen extends StatefulWidget {
  final int score;
  final List<Question> correctAnswers;
  final List<Question> incorrectAnswers;

  const Resultsscreen({
    required this.score,
    required this.correctAnswers,
    required this.incorrectAnswers,
    super.key});

  @override
  State<Resultsscreen> createState() => _ResultsscreenState();
}

class _ResultsscreenState extends State<Resultsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("Results",
        style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w600
        ),),
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.lightBlueAccent,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Score: ${widget.score}",
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  "You Answered Correctly to the Following Questions:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                ...widget.correctAnswers.map((question) => ListTile(
                      title: Text("--> "+question.description, style: TextStyle(color: Colors.brown),),
                      
                    )),
                const SizedBox(height: 16),
                const Text(
                  "You Answered Incorrectly to the Following Questions:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                ...widget.incorrectAnswers.map((question) => ListTile(
                      title: Text("--> "+question.description,  style: TextStyle(color: Colors.brown),),
                    )),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.yellow
                    ),
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => const StartQuiz()
                      ),);
                    },
                    child: const Text("Back to Quiz"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}