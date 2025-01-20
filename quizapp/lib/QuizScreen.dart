import 'package:flutter/material.dart';
import 'package:quizapp/ResultsScreen.dart';
import 'package:quizapp/model/DataFetch.dart';
import 'package:quizapp/model/QuizQuestion.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Future<List<Question>> _questionsFuture;
  int _currentQuestionIndex = 0;
  int _score = 0;
  List<Question> _correctAnswers = [];
  List<Question> _incorrectAnswers = [];

  @override
  void initState() {
    super.initState();
    _questionsFuture = ApiService().fetchQuestions().then((data) => data
        .map((item) => Question.fromJson(item as Map<String, dynamic>))
        .toList());
  }

  void _onAnswerSelected(bool isCorrect, Question question) {
    if (isCorrect) {
      setState(() {
        _score += 10;
        _correctAnswers.add(question);
      });
    } else {
      _incorrectAnswers.add(question);
    }

    if (_currentQuestionIndex < 9) {
      // Assuming there are 5 questions
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _showResults();
    }
  }

  void _showResults() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Quiz Completed!!"),
        content: Text("You scored $_score points!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: Text("Home"),
          ),
        ],
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Resultsscreen(
          score: _score,
          correctAnswers: _correctAnswers,
          incorrectAnswers: _incorrectAnswers,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz Questions',
           style: TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.w600
        ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Question>>(
        future: _questionsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final questions = snapshot.data!;
            final question = questions[_currentQuestionIndex];

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              Text('Question Number ${_currentQuestionIndex + 1}:',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
              const SizedBox(height: 20,),
                Card(
                  elevation: 5,
                  child: Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Q${_currentQuestionIndex + 1}: ${question.description}",
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                ...question.options.map((option) {
                  return ListTile(
                    tileColor: Colors.lightGreenAccent,
                    title: Text(option.description, style: TextStyle(fontSize: 18),),
                    leading: Radio<bool>(
                      value: option.isCorrect,
                      groupValue: null,
                      onChanged: (value) {
                        _onAnswerSelected(option.isCorrect, question);
                      },
                    ),
                  );
                }).toList(),
              ],
            );
          } else {
            return const Center(child: Text("No questions available"));
          }
        },
      ),
    );
  }
}
