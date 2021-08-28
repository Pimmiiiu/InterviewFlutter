import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:interview_flutter/BasicLayout.dart';

import 'CodiumLoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interview Problems for Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Interview Problems for Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController? _controller;
  var number;
  var n;

  _printNumber({var num}) {
    for (var i = 1; i <= num; i++) {
      if (i % 3 == 0 && i % 5 == 0) {
        print('FizzBuzz');
      } else if (i % 3 == 0) {
        print('Fizz');
      } else if (i % 5 == 0) {
        print('Buzz');
      } else {
        print(i);
      }
    }
  }

  _leapYear({int? num}) {
    if (num! % 100 == 0) {
      if (num % 400 == 0) {
        print('$num -> true');
      } else {
        print('$num -> false');
      }
    } else {
      if (num % 4 == 0) {
        print('$num -> true');
      } else {
        print('$num -> false');
      }
    }
  }

  _no3point1({int? num}) {
    print('n = $num');
    for (var i = 0; i < num!; i++) {
      List<String>? text = [];
      for (var j = 1; j < num - i; j++) {
        text.add(' ');
      }
      for (var j = 0; j <= i; j++) {
        text.add('*');
      }
      print(text.join());
    }
  }

  _no3point2({int? num}) {
    print('n = $num');
    for (var i = 1; i <= num!; i++) {
      List<String>? text = [];
      for (var j = 0; j < num; j++) {
        if (j == (num - i)) {
          text.add("*");
        } else {
          text.add(" ");
        }
      }
      for (var j = (num - 1); j > 0; j--) {
        if ((j - 1) == (num - i)) {
          text.add("*");
        } else {
          text.add(" ");
        }
      }
      print(text.join());
    }
  }

  _no3point3({int? num}) {
    print('n = $num');
    for (var i = 1; i <= num!; i++) {
      List<String>? text = [];
      for (var j = 0; j < num; j++) {
        if (j == (i - 1)) {
          text.add("*");
        } else if (j == (num - i)) {
          text.add("*");
        } else {
          text.add(" ");
        }
      }
      print(text.join());
    }
  }

  _checkPrimeNumber({int? num}) {
    List<int> listPrime = [];
    for (var i = 2; i <= num!; i++) {
      listPrime.add(i);
    }
    for (var i = 2; i <= num; i++) {
      for (var j = 2; j < i; j++) {
        if (i % j == 0) {
          listPrime.remove(i);
          break;
        }
      }
    }
    print('$num -> ${listPrime.join(" ")}');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                /// No.1
                ElevatedButton(
                    onPressed: () => _printNumber(num: 100),
                    child: Text('Tap to print No.1')),

                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Enter Year'),
                  onChanged: (text) {
                    if (text != '') {
                      number = int.parse(text);
                    }
                  },
                ),

                /// No.2
                ElevatedButton(
                    onPressed: () => _leapYear(num: number),
                    child: Text('Tap to print No.2 ')),

                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Enter number'),
                  onChanged: (text) {
                    if (text != '') {
                      n = int.parse(text);
                    }
                  },
                ),

                /// No.3.1
                ElevatedButton(
                    onPressed: () => _no3point1(num: n ?? 0),
                    child: Text('Tap to print No.3.1 ')),

                /// No.3.2
                ElevatedButton(
                    onPressed: () => _no3point2(num: n ?? 0),
                    child: Text('Tap to print No.3.2 ')),

                /// No.3.3
                ElevatedButton(
                    onPressed: () => _no3point3(num: n ?? 0),
                    child: Text('Tap to print No.3.3 ')),

                /// No.4
                ElevatedButton(
                    onPressed: () => _checkPrimeNumber(num: n ?? 0),
                    child: Text('Tap to print No.4')),

                /// No.5
                ElevatedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BasicLayout())),
                    child: Text('Tap to Basic layout No.5')),

                /// No.6
                ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CodiumLoginPage())),
                    child: Text('Tap to Codium Login page No.6')),
              ],
            ),
          ),
        ));
  }
}
