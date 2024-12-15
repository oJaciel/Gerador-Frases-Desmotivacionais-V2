import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  FloatingButton(
    this.newPhrase,
    this.buttonClicked
  );

  final void Function() newPhrase;
  final bool buttonClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      child: FloatingActionButton.extended(
        onPressed: newPhrase,
        label: Row(
          children: [
            (!buttonClicked)
                ? const Text(
                    'Nova frase',
                  )
                : const Icon(Icons.refresh),
          ],
        ),
      ),
    );
  }
}
