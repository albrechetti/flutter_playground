import 'package:flutter/material.dart';

class Exercicio02 extends StatefulWidget {
  const Exercicio02({Key? key}) : super(key: key);

  @override
  _Exercicio02State createState() => _Exercicio02State();
}

class _Exercicio02State extends State<Exercicio02> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 2 - Animação Implícita'),
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          bool isExpand = false;
          if (index == selectedItem) {
            isExpand = true;
          }
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (selectedItem == index) {
                    selectedItem = -1;
                  } else {
                    selectedItem = index;
                  }
                });
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('My Expasion tile $index'),
                        AnimatedRotation(
                          duration: const Duration(milliseconds: 500),
                          turns: isExpand ? 0.5 : 0,
                          child: const Icon(Icons.expand_more),
                        ),
                      ],
                    ),
                    ClipRect(
                      child: AnimatedAlign(
                        duration: const Duration(milliseconds: 500),
                        alignment: Alignment.center,
                        heightFactor: isExpand ? 1.5 : 0,
                        child: Column(
                          children: const [
                            FlutterLogo(
                              size: 60,
                            ),
                            SizedBox(height: 10),
                            Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sollicitudin, magna non varius pharetra, est lectus imperdiet tellus, eu rutrum ante mauris at urna.'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
