import 'dart:io';
// Final exiricse: Create a simple quiz application using oop that allows users to play and view their score
class QuizGame {
  List<Quiz> quizList = [
    Quiz("What is the capital city of Algeria?", ["Algiers", "Oran", "Blida", "Constantine"], 1),
    Quiz("What is the official language of Algeria?", ["French", "Berber", "English", "Arabic"], 4),
    Quiz("What is the largest desert in Algeria?", ["Sahara Desert", "Gobi Desert", "Arabian Desert", "Kalahari Desert"], 1),
    Quiz("What is the highest mountain in Algeria?", ["Mount Djebel Siroua", "Mount Toubkal", "Mount Tahat", "Mount Merouane"], 3),
    Quiz("Which of the following is a traditional Algerian dish?", ["Paella", "Chakchouka", "Sushi", "Tacos"],2)
  ];
  int currentQuiz = 0;

  Quiz getNextQuiz() {
    currentQuiz += 1;
    return quizList[currentQuiz-1];
  }

  bool isOver() {
    if (quizList.length > currentQuiz) {
      return false;
    }
    return true;
  }
}

class Quiz {
  String? question;
  List<String>? prompts;
  int? answer;
  Quiz(this.question, this.prompts, this.answer);

  void displayQuestion() {
    print("Question: $question");
  }

  void displayPrompts() {
    for (int i = 0; i < prompts!.length; i++){
      print("${i+1}- ${prompts![i]}");
    }
  }

  bool checkValidity(int? playerAnswer) {
    return answer == playerAnswer!;
  }
}
class Player {
  int score = 0;

  int? getAnswer() {
    String? answer;
    do {
      print("Your answer (has to be [1, 2, 3 or 4]):");
      answer = stdin.readLineSync();
    } while(int.tryParse(answer!) == null || int.parse(answer) > 4 || int.parse(answer) < 1);
    
    return int.parse(answer);
  }

  void incScore() {
    score += 1;
  }

  void resetScore() {
    score = 0;
  }

  void showScore() {
    print("Your score is $score");
  }
}

void main() {
  Player player = Player();
  QuizGame game = QuizGame();
  Quiz quiz;
  String? choice;
  bool running = true;

  print("Welcome to the quiz application");
  while (running) {
    print("Type \n(p) - to play\n(s) - to view score\n(q) - to quit");
    choice = stdin.readLineSync();
    
    switch(choice) {
      case "p": {
        player.resetScore();
        while (!game.isOver()) {
          quiz = game.getNextQuiz();
          quiz.displayQuestion();
          quiz.displayPrompts();
          if (quiz.checkValidity(player.getAnswer())) {
            player.incScore();
          }
        }
        break;
      }
      case "s": {
        player.showScore();
        break;
      }
      case "q": {
        running = false;
        break;
      }
    }
  }
}