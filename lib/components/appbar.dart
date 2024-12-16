import 'package:flutter/material.dart';
import 'package:gerador_frases_desmotivacionais/components/image_share.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  Appbar(
    this.imgText,
    this.backgroundColor,
  );

  //Frase que vai para o compartilhar
  final String imgText;
  //Cor de fundo que vai para o compartilhar
  final Color backgroundColor;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: const Text(
        'Gerador de Frases (Des)Motivacionais',
        style: TextStyle(fontSize: 16),
      ),
      actions: [ImageShare(imgText, backgroundColor)],
    );
  }
}
