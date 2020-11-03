import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

final int pontuacao;
final void Function() quandoReiniciarQuestionario;

Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

String get fraseResultado {
  if(pontuacao < 10) {
    return 'Insuficiente!!!';
  }else if(pontuacao < 20) {
    return 'Você é bom!';
  }else if(pontuacao < 40) {
    return 'Impressionante!';
  }else{
    return 'Nível JEDI!';
  }
}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
              child: Text(fraseResultado,
              style: TextStyle(fontSize: 28),
              ),
            ),
            FlatButton(
              child: Text(
                'Deseja Reiniciar ?',
              style: TextStyle(fontSize: 18),
              ),
              textColor: Colors.green,
              onPressed: quandoReiniciarQuestionario,
            )
      ],
    );
  }
}