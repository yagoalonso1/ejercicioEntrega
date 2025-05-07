import 'package:flutter/material.dart';

class NumberView extends StatelessWidget {
  final String text;
  final int value;

  const NumberView({super.key, required this.text, required this.value});
// vista del número funcional
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.grey,
                ),
          ),
          Text("$value", style: Theme.of(context).textTheme.titleLarge)
        ],
      ),
    );
  }
}
