import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: const Text(
        'Gerador de Frases (Des)Motivacionais',
      ),
    );
  }
}