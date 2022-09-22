import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatefulWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntasSelecionada;
  final void Function(int) quandoResponder;
  Questionario(
      {required this.perguntas,
      required this.perguntasSelecionada,
      required this.quandoResponder});

  @override
  State<Questionario> createState() => _QuestionarioState();
}

class _QuestionarioState extends State<Questionario> {
  bool get temPerguntaSelecionada {
    return widget.perguntasSelecionada < widget.perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? widget.perguntas[widget.perguntasSelecionada].cast()['Resposta']
        : [];
    return Column(
      children: <Widget>[
        Questao(
          widget.perguntas[widget.perguntasSelecionada]['texto'].toString(),
        ),
        ...respostas.map((resp) {
          return Resposta(
              resp['texto'].toString(),
              () => widget.quandoResponder(
                    int.parse(resp['nota'].toString()),
                  ));
        }).toList()
      ],
    );
  }
}
