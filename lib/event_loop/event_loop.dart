void main() async {
  methodA();
  await methodB();
  await methodC('Main');
  methodD();
}

methodA() {
  print('A');
}

methodB() async {
  print('B Start');
  await methodC('B');
  print('B End');
}

methodC(String from) async {
  print('C Start from $from');
  Future(() {
    print('C runing Future from $from');
  }).then((_) {
    print('C END of Future from $from');
  });

  print('C End from $from');
}

methodD() {
  print('D');
}
