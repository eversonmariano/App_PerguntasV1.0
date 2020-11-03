import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuaçao': 8},
        {'texto': 'Vermelho', 'pontuaçao': 10},
        {'texto': 'Verde', 'pontuaçao': 2},
        {'texto': 'Azul', 'pontuaçao': 6},
      ],
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuaçao': 10},
        {'texto': 'Cobra', 'pontuaçao': 6},
        {'texto': 'Tubarão', 'pontuaçao': 9},
        {'texto': 'Boi', 'pontuaçao': 5},
      ],
    },
    {
      'texto': 'Qual sua linguagem de programação favorita?',
      'respostas': [
        {'texto': 'C', 'pontuaçao': 9},
        {'texto': 'Python', 'pontuaçao': 4},
        {'texto': 'Java', 'pontuaçao': 10},
        {'texto': 'Dart', 'pontuaçao': 9},
      ],
    },
    {
      'texto': 'Qual seu Professor favorito?',
      'respostas': [
        {'texto': 'Cesar', 'pontuaçao': 10},
        {'texto': 'Marcelo', 'pontuaçao': 5},
        {'texto': 'Ruan', 'pontuaçao': 7},
        {'texto': 'Henrique', 'pontuaçao': 9},
      ],
    },
  ]; //Temos aqui um Map<> e não declaramos, pois o Dart é uma linguagem bastante intuiva.

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas...'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
      debugShowCheckedModeBanner: false,
    );
    
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
