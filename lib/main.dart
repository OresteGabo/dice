import 'package:flutter/material.dart';
import 'dart:math';

/*
void main() {
  runApp(MyApp());
}
*/
void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('This is a text'),
        ),
        backgroundColor: Colors.red,
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int rightDice = 5;
  int leftDice = 5;
  void rollDice() {
    rightDice = Random().nextInt(6) + 1;
    leftDice = Random().nextInt(6) + 1;
    print('rolling dice');
    while (rightDice == leftDice) {
      leftDice = Random().nextInt(6) + 1;
    }
  }

  void initialise() {
    rightDice = 1;
    leftDice = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    rollDice();
                    print('Left =$leftDice right=$rightDice');
                  });
                },
                child: Text('Roll Dice'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    print('Left =$leftDice right=$rightDice');
                  });
                },
                child: Text('initialise'),
              ),
            ],
          ),
          Center(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          rollDice();
                          print('Left =$leftDice right=$rightDice');
                        });
                      },
                      child: Image.asset('images/dice$leftDice.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('images/dice$rightDice.png'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
