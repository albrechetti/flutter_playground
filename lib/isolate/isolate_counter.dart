import 'dart:isolate';
import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    var _isolate = IsolateCounter();
    int _counter = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Isolate Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
                stream: _isolate.portResultListener,
                initialData: 0,
                builder: (context, snapshot) {
                  _counter = snapshot.data as int;
                  return Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () => _isolate.increment(_counter),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => _isolate.decrement(_counter),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class IsolateCounter {
  var portResultListener = ReceivePort();

  void increment(int i) => _sendIsolate(i, true);
  void decrement(int i) => _sendIsolate(i, false);

  _sendIsolate(int i, bool isIncrement) async {
    var portListeningMainIsolate = ReceivePort();

    await Isolate.spawn(_isolateLogic, portListeningMainIsolate.sendPort);
    var portInternalIsolate = await portListeningMainIsolate.first;

    portInternalIsolate.send(
      IsolateMessage(portResultListener.sendPort, {
        'value': i,
        'isIncrement': isIncrement,
      }),
    );
  }

  static _isolateLogic(SendPort message) {
    var portInternalIsolate = ReceivePort();
    message.send(portInternalIsolate.sendPort);

    portInternalIsolate.listen((message) {
      var isolateAwaitingResponse = message.isolate;
      int value = message.payload['value'];
      bool isIncrement = message.payload['isIncrement'];

      isolateAwaitingResponse.send(isIncrement ? ++value : --value);
    });
  }
}

class IsolateMessage {
  SendPort isolate;
  Map payload;
  IsolateMessage(this.isolate, this.payload);
}
