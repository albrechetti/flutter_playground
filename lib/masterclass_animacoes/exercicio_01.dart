import 'package:flutter/material.dart';

class Exercicio01 extends StatefulWidget {
  const Exercicio01({Key? key}) : super(key: key);

  @override
  _Exercicio01State createState() => _Exercicio01State();
}

class _Exercicio01State extends State<Exercicio01> {
  bool isTaped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercício 01 - Animação implícita "),
      ),
      body: Material(
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 500),
          alignment: isTaped ? Alignment.topCenter : Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isTaped = !isTaped;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                width: isTaped ? 100 : 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: isTaped
                      ? BorderRadius.circular(0)
                      : BorderRadius.circular(50),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
