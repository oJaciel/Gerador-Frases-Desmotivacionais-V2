import 'package:flutter/material.dart';
import "dart:math";

void main(List<String> args) {
  runApp(App());
}

class App extends StatefulWidget {
  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  //Variável da frase mostrada na tela
  String _phrase = "Clique no botão para gerar uma nova frase";

  //Lista das frases
  var _phrase_list = [
  "Nada como um dia pior que o outro.",
  "Comemore as pequenas derrotas.",
  "Os sonhos antecedem os fracassos.",
  "O caminho é longo, mas a derrota é certa.",
  "É só uma fase ruim, logo vai piorar.",
  "Nunca foi azar, sempre foi incompetência.",
  "Seja o protagonista do seu fracasso.",
  "Não pare! Faça até dar errado.",
  "Só dará errado se você tentar.",
  "Nunca é tarde demais para desistir.",
  "A mediocridade é o destino de todos.",
  "Não se preocupe em tentar, você vai falhar de qualquer maneira.",
  "Por que tentar se você pode falhar sem esforço?",
  "A única constante na vida é o seu fracasso.",
  "Não há luz no fim do túnel, apenas mais escuridão.",
  "Nunca subestime sua capacidade de falhar.",
  "Nada é impossível - para o fracasso.",
  "Não há problema em falhar, desde que você esteja acostumado.",
  "Por que tentar se você pode culpar as circunstâncias?",
  "Não é só uma fase ruim - é uma vida ruim.",
  "Expectativas baixas, decepções menores.",
  "Não se preocupe em tentar, você já sabe como isso vai terminar.",
  "Seu potencial é limitado - assim como suas chances de sucesso.",
  "Seja realista - você não vai chegar muito longe.",
  "Se você acha que pode, você está enganado.",
  "Quando tudo estiver dando errado, se acostume.",
  "Não dá pra mudar o passado, mas dá pra estragar o futuro.",
  "Nenhum obstáculo é grande demais para quem desiste!",
  "Seu sucesso é tão provável quanto uma loteria.",
  "Não se esforce demais - ninguém se importa.",
  "A vida é um ciclo interminável de decepções.",
  "Não se preocupe em se destacar - você é facilmente esquecível.",
  "O fracasso é a única coisa que você pode contar.",
  "Por que tentar quando você pode desistir com antecedência?",
  "Desistir é mais fácil do que continuar tentando.",
  "Não espere nada da vida - ela não espera nada de você.",
  "Não há recompensa pelo seu esforço - apenas mais dor.",
  "Seja realista: suas ambições são inalcançáveis.",
  "O sucesso é uma miragem em seu deserto de falhas.",
  "Você não é excepcional - apenas medíocre em uma multidão.",
  "A vida é uma sucessão de arrependimentos e lamentações.",
  "Não busque a felicidade - você nunca a encontrará.",
  "Por que se preocupar com o futuro se ele só trará desgosto?",
  "A esperança é apenas uma ilusão para os tolos.",
  "Não se esforce - você não merece mais do que isso.",
  "Seu potencial é insignificante - como sua existência.",
  "O sucesso é um conceito estranho e distante para você.",
  "A vida é uma piada cruel, e você é a vítima.",
  "Não tente impressionar - ninguém está prestando atenção.",
  "Seu destino é o fracasso, então abrace-o.",
  "Você nunca será bom o suficiente - e isso é um fato.",
  "Seu legado será esquecido - como tudo o mais em sua vida.",
  "Não se iluda pensando que pode mudar algo - você é impotente.",
  "Por que se esforçar quando você está destinado a falhar?",
  "Não há luz no fim do túnel - apenas mais desespero.",
  "Desistir é a única opção sensata em sua situação."
];


  //Função para trocar a frase da tela
  void _newPhrase() {
    //Captando um elemento aleatório da lista de frases
    var phrase = _phrase_list[Random().nextInt(_phrase_list.length)].toString();
    setState(() {
      //A frase da tela agora é a frase aleatória
      _phrase = phrase;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(_phrase),
              ElevatedButton(
                onPressed: _newPhrase,
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
