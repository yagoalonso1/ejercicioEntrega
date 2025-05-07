import 'dart:math';

class Game {
  static final int MIN_VALUE = 0;
  static final int MAX_VALUE = 100;

  int _targetValue = 0;
  int _points = 0; //puntos obtenidos
  int _score = 0; //puntuación total
  int _rounds = 0; //número de rondas jugadas

  //Queremos guardar las marcas en una lista de listas, donde cada lista contiene la puntuación y la fecha.
  //Para ello, utilizamos List<List<dynamic>>.
  List<List<dynamic>> _marks = [];
  //Lista para guardar las 5 mejores marcas.
  List<List<dynamic>> _top5marks = [];

  //getters
  int get targetValue => _targetValue;
  int get points => _points;
  int get score => _score;
  int get rounds => _rounds;
  List<List<dynamic>> get marks => _marks;
  List<List<dynamic>> get top5marks => _top5marks;

  Game() {
    _targetValue = Random().nextInt(MAX_VALUE + 1 - MIN_VALUE) + MIN_VALUE;
  }

// función para calcular los puntos obtenidos en cada ronda
  void calculatePoints(double sliderValue) {
    int sliderValueInt = sliderValue.round().toInt();
    int difference = (_targetValue - sliderValueInt).abs();
    _points = (MAX_VALUE - difference);
    _score += _points;
    _rounds++;
  }

// función para la siguiente ronda (solo reinicia los puntos de ahora no los totales)
  void reset() {
    _targetValue = Random().nextInt(MAX_VALUE + 1 - MIN_VALUE) + MIN_VALUE;
    DateTime now = DateTime.now();
    _marks.add([_points, now]);
    getTop5Marks();
    _points = 0;
  }

// función para reiniciar el juego (reinicia todos los valores)
  void restartGame() {
    _targetValue = Random().nextInt(MAX_VALUE + 1 - MIN_VALUE) + MIN_VALUE;
    _points = 0;
    _score = 0;
    _rounds = 0;
  }

  void getTop5Marks() {
    // Ordenamos todas las marcas en _marks de mayor a menor puntuación, por cada elemento guardamos [score, fecha].
    //Funciona primero primero comparandolos, luego accede a la puntuación de cada elemento, devuelve >0 si b[0] > a[0], es decir, orden descendente.
    //Luego tomamos solo los primeros 5 elementos de la lista ordenada y los guardamos en _top5marks.
    _marks.sort((a, b) => b[0].compareTo(a[0]));
    //PARA EL TOP 5
    // Igualamos para recoger la lista para el top 5, cojemos los 5 primeros elementos con take(5) y con el toList() lo convertimos a una lista.
    // Esto nos da las 5 mejores puntuaciones que guardamos en '_top5marks'
    _top5marks = _marks.take(5).toList();
  }
}
