import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNo = 1;
  int rightDiceNo = 1;
  var randomDice = Random(DateTime.now().millisecondsSinceEpoch);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      leftDiceNo = randomDice.nextInt(6) + 1;
                      rightDiceNo = randomDice.nextInt(6) + 1;
                    });
                  },
                  child: Image(
                    image: AssetImage('images/dice$leftDiceNo.png'),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    onPressed: (){
                      setState(() {
                        rightDiceNo = randomDice.nextInt(6) + 1;
                        leftDiceNo = randomDice.nextInt(6) + 1;
                      });
                    },
                    child: Image(
                      image: AssetImage('images/dice$rightDiceNo.png'),
                    ),
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}


