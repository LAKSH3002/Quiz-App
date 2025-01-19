class Question {
  final int id;
  final String description;
  final List<Option> options;

  Question({required this.id, required this.description, required this.options});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      description: json['description'],
      options: (json['options'] as List)
          .map((option) => Option.fromJson(option))
          .toList(),
    );
  }
}

class Option {
  final int id;
  final String description;
  final bool isCorrect;

  Option({required this.id, required this.description, required this.isCorrect});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      description: json['description'],
      isCorrect: json['is_correct'],
    );
  }
}
