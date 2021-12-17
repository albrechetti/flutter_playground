import 'dart:math';

import 'package:flutter/material.dart';

class AnimacoesEstudo02 extends StatefulWidget {
  const AnimacoesEstudo02({Key? key}) : super(key: key);

  @override
  _AnimacoesEstudo02State createState() => _AnimacoesEstudo02State();
}
class _AnimacoesEstudo02State extends State<AnimacoesEstudo02> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.black;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Random Shapes Animation'),
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Click aqui para gerar uma forma aleatória',
        backgroundColor: Colors.white54,
        onPressed: () {
          final random = Random();
          setState(() {
            _width = random.nextInt(400).toDouble();
            _height = random.nextInt(400).toDouble();
            _color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            );
            _borderRadius =
                BorderRadius.circular(random.nextInt(1000).toDouble());
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
            )
          ],
        ),
      ),
    );
  }
}
