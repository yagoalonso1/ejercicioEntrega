import 'package:flutter/material.dart';
import 'package:slider_app/models/game.dart';

class Viewmodel extends ChangeNotifier {
  final Game _game = Game();

  int get targetValue => _game.targetValue;
  int get points => _game.points;
  int get score => _game.score;
  int get rounds => _game.rounds;
  List<List<dynamic>> get marks => _game.marks;
  List<List<dynamic>> get top5marks => _game.top5marks;

// método para calcular los puntos
  void calculatePoints(double sliderValue) {
    _game.calculatePoints(sliderValue);
    // notifyListeners notifica
    notifyListeners();
  }

// método para reiniciar la puntuación (automaticamente después de cada ronda)
  void reset() {
    _game.reset();
    notifyListeners();
  }

// método para reiniciar el juego (reinicia todos los valores)
  void restartGame() {
    _game.restartGame();
    notifyListeners();
  }
}
// runear el juego
// flutter run -d chrome