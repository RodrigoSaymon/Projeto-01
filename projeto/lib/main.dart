import 'package:flutter/material.dart';

void main() {
  runApp(const Rodrigo());
}

class Rodrigo extends StatefulWidget {
  const Rodrigo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RodrigoState();
  }
}

class RodrigoState extends State<Rodrigo> {
  var pertuntas = ['Nome', 'Idade', 'Endereço', 'Telefone'];

  var incrementoIndex = 0;

  void perguntado() {
    setState(() {
      incrementoIndex++;
    });
  }

  void desperguntado() {
    setState(() {
      incrementoIndex--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntador App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                pertuntas[incrementoIndex],
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: desperguntado,
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    onPressed: perguntado,
                    child: const Icon(Icons.add),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
