import 'package:flutter/material.dart';

class Estudo01 extends StatefulWidget {
  const Estudo01({Key? key}) : super(key: key);

  @override
  _Estudo01State createState() => _Estudo01State();
}

class _Estudo01State extends State<Estudo01> {
  bool taped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estudo 01'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Toque no ${taped ? 'circulo' : 'quadrado'} para mudar o estado',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  taped = !taped;
                });
              },
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: taped
                      ? BorderRadius.circular(1000)
                      : BorderRadius.circular(0),
                  color: taped ? Colors.red : Colors.blue,
                ),
                width: taped ? 200 : 300,
                height: taped ? 200 : 300,
                curve: Curves.linear,
                duration: const Duration(milliseconds: 300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}