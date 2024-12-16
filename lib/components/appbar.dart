import 'package:flutter/material.dart';
import 'package:gerador_frases_desmotivacionais/components/image_share.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  Appbar(this.phraseForShare);

  final String phraseForShare;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: const Text(
        'Gerador de Frases (Des)Motivacionais',
      ),
      actions: [ImageShare(phraseForShare)],
    );
  }
}
