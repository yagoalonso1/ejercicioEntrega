import 'package:flutter/material.dart';

class RoundedView extends StatelessWidget {
  final IconData icon;

  const RoundedView({super.key, required this.icon});
// vista de la figura cuadrada
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
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
      child: Icon(icon),
    );
  }
}
