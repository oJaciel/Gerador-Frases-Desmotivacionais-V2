import 'package:flutter/material.dart';

class Phrase extends StatelessWidget {
  final String phrase;

  Phrase(
    this.phrase,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(phrase),
      height: MediaQuery.of(context).size.height,
    );
  }
}
