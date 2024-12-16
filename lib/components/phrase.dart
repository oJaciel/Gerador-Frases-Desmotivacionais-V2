import 'package:flutter/material.dart';

class Phrase extends StatelessWidget {
  final String phrase;
  final double availableHeight;

  Phrase(this.phrase, this.availableHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: availableHeight, //Altura é sempre o tamanho total disponível da tela
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            phrase,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
