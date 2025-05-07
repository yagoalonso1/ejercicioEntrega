import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slider_app/viewmodel/viewmodel.dart';

class MarksView extends StatelessWidget {
  const MarksView({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<Viewmodel>();
    return Scaffold(
      appBar: AppBar(title: Text("Marks")),
      // ListView.builder para mostrar cada una en una card e iterar sobre la lista (solo de top5marks)
      body: ListView.builder(
        itemCount: appState.top5marks.length, // solo para la lista de top5marks
        itemBuilder: (context, index) {
          // visual
          return Center(
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text("Score: ${appState.top5marks[index][0]}"),
                  subtitle: Text(
                    "Date: ${appState.top5marks[index][1].toString()}",
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
