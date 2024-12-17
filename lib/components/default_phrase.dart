import 'package:flutter/material.dart';

class DefaultPhrase extends StatelessWidget {
  //Tamanho disponível da tela, captado da main
  final double availableHeight;

  DefaultPhrase(
    this.availableHeight,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          availableHeight, //Altura é sempre o tamanho total disponível da tela
      width: MediaQuery.of(context).size.width,
      child: const Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Clique no botão abaixo para gerar uma nova frase',
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
