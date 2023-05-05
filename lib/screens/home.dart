import 'package:flutter/material.dart';
import 'package:primero_projeto_flutter/components/task.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Task(
                nome: 'Aprender flutter',
                foto: 'imagens/avatar.jpg',
                dificuldade: 4),
            Task(
                nome: 'andar de bike',
                foto: 'imagens/an_american_wolf.jpg',
                dificuldade: 0),
            Task(
              nome: 'Ler',
              foto: 'imagens/exorcista.jpg',
              dificuldade: 3,
            ),
            Task(
              nome: 'Praticar Yoga',
              foto: 'imagens/shazam.jpg',
              dificuldade: 2,
            ),
            Task(
              nome: 'Jogar',
              foto: 'imagens/tetris.jpg',
              dificuldade: 1,
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
