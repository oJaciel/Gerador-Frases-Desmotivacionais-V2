import 'package:flutter/material.dart';
import 'package:gerador_frases_desmotivacionais/components/appbar.dart';
import 'package:gerador_frases_desmotivacionais/components/floating_button.dart';
import "dart:math";
import 'package:gerador_frases_desmotivacionais/components/phrase.dart';
import 'package:gerador_frases_desmotivacionais/data/phrase_provider.dart';
import 'package:gerador_frases_desmotivacionais/theme/app_theme.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  //Variável da frase mostrada na tela
  String _phrase = "Clique no botão para gerar uma nova frase";

  final _phraseList = PhraseProvider.phraseList;
  var _buttonClicked = false;

  // Variável para armazenar a cor de fundo atual
  Color _backgroundColor = Colors.white;

  // Função para gerar uma cor *clara* aleatória
  Color _generateLightColor() {
    final Random random = Random();
    int r = 200 + random.nextInt(56); // Valores de 200 a 255
    int g = 200 + random.nextInt(56); // Valores de 200 a 255
    int b = 200 + random.nextInt(56); // Valores de 200 a 255
    return Color.fromARGB(255, r, g, b);
  }

  //Função para trocar a frase da tela e mudar cor de fundo
  void _newPhrase() {
    //Captando um elemento aleatório da lista de frases
    var phrase = _phraseList[Random().nextInt(_phraseList.length)].toString();
    setState(() {
      //A frase da tela agora é a frase aleatória
      _phrase = phrase;
      // Gera uma nova cor de fundo aleatória
      _backgroundColor = _generateLightColor();
    });
    _buttonClicked = true;
  }

  @override
  Widget build(BuildContext context) {
    final appBar = Appbar(_phrase, _backgroundColor); //Instância da Appbar

    //Tamanho disponível = altura da tela - tamanho do appBar
    final availableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return MaterialApp(
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBar,
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: _backgroundColor,
          child: Phrase(_phrase, availableHeight),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingButton(_newPhrase, _buttonClicked),
      ),
    );
  }
}
