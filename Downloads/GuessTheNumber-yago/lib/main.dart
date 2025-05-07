import 'package:flutter/material.dart';
import 'package:slider_app/app_colors.dart';
import 'package:slider_app/views/background_view.dart';
import 'package:slider_app/models/game.dart';
import 'package:slider_app/slider_widget.dart';
import 'package:provider/provider.dart';
import 'package:slider_app/viewmodel/viewmodel.dart';
import 'package:slider_app/views/marks_view.dart';
import 'package:slider_app/views/number_view.dart';
import 'package:slider_app/views/rounded_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // se usa ChangeNotifierProvider para que todas las vistas puedan acceder al ViewModel (creando una instancia de Viewmodel)
    return ChangeNotifierProvider(
      create: (context) => Viewmodel(),
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
        home: Scaffold(
          body: Stack(children: [const BackgroundView(), const ContentView()]),
        ),
      ),
    );
  }
}

class ContentView extends StatefulWidget {
  const ContentView({super.key});

  @override
  State<ContentView> createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  double _value = 50.0;
  final double _min = 1.0;
  final double _max = 100.0;
  final Game _game = Game();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<Viewmodel>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("💀💀💀💀", style: Theme.of(context).textTheme.headlineMedium),
          Text(
            "${appState.targetValue}",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  letterSpacing: -1,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SliderWidget(
              value: _value,
              min: _min,
              max: _max,
              onChanged: _onChanged,
            ),
          ),
          Text("${_value.toInt()}"),
          //boton para intentar.
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(48, 48),
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "TRY",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _onChanged(double value) {
    setState(() {
      _value = value;
    });
  }

  void onPressed() {
    print("Botón pulsado");

    var appState = Provider.of<Viewmodel>(context, listen: false);
    appState.calculatePoints(_value);

    try {
      // alerta de cuantos puntos has aceptado
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Felicidades"),
          content: Text("Has conseguido ${appState.points} puntos"),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  appState.reset();
                  _value = 50.0;
                });
                Navigator.pop(context);
              },
              // para salir de la alerta
              child: Text("OK"),
            ),
          ],
        ),
      );
    } catch (e) {
      print("Error al mostrar la alerta: $e");
    }
  }
}
