import 'package:flutter/material.dart';
import 'package:slider_app/views/marks_view.dart';
import 'package:slider_app/views/number_view.dart';
import 'package:slider_app/views/rounded_view.dart';
import 'package:provider/provider.dart';
import 'package:slider_app/viewmodel/viewmodel.dart';

class BackgroundView extends StatelessWidget {
  const BackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<Viewmodel>();
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            // para que los botones a la misma altura (misma fila)
            children: [
              // para reiniciar el juego
              TextButton(
                  onPressed: () {
                    appState.restartGame();
                  },
                  // icono de refresh (reiniciar)
                  child: RoundedView(icon: Icons.refresh)),
              Spacer(),
              // para mostrar la informacion del top 5 de marcas del juego
              TextButton(
                  onPressed: () {
                    // Navigator.push es para navegar a MarksView
                    Navigator.push(
                        context,
                        //MaterialPageRoute crea la ruta para navegar a la vista de MarksView
                        MaterialPageRoute(
                            builder: (context) => const MarksView()));
                  },
                  // icono de i(información)
                  child: RoundedView(icon: Icons.info)),
            ],
          ),
          Spacer(),
          Row(
            children: [
              // para mostrar la puntuación acumulada
              NumberView(text: "SCORE", value: appState.score),
              Spacer(),
              // para mostrar las rondas acumuladas
              NumberView(text: "ROUNDS", value: appState.rounds),
            ],
          ),
        ],
      ),
    );
  }
}
