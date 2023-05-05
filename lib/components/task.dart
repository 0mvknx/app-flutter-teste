import 'package:flutter/material.dart';
import 'package:primero_projeto_flutter/components/difficulty.dart';

class Task extends StatefulWidget {
  const Task(
      {super.key, required this.nome, this.foto, required this.dificuldade});

  final String nome;
  final String? foto;
  final int dificuldade;

  @override
  State<Task> createState() => _TaskState();
}

class ColorContainer extends StatelessWidget {
  ColorContainer({super.key, required this.nivel});

  final int nivel;
  final List<Color> listColors = [
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.red,
    Colors.black
  ];

  @override
  Widget build(BuildContext context) {
    final index = (nivel - 1) ~/ 10;
    final color = listColors[index.clamp(0, listColors.length - 1)];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      height: 140,
    );
  }
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ColorContainer(nivel: nivel),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 72,
                      color: Colors.brown,
                      child: Image.asset(widget.foto!, fit: BoxFit.cover),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: const TextStyle(
                              fontSize: 20,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Difficulty(difficultyLevel: widget.dificuldade),
                      ],
                    ),
                    SizedBox(
                      width: 52,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            nivel++;
                          });
                        },
                        child: Column(
                          children: const [
                            Icon(
                              Icons.arrow_drop_up,
                            ),
                            Text(
                              'UP',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        value: widget.dificuldade > 0
                            ? nivel / widget.dificuldade / 10
                            : 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Nível: $nivel',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
