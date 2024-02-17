import 'package:flutter/material.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  final TextEditingController _textController = TextEditingController();
  String _firstNumber = "";
  String _operator = "";

  void _updateText(String value) {
    switch (value) {
      case '+':
      case '-':
      case '*':
      case '/':
        _firstNumber = _textController.text;
        _operator = value;
        _textController.text = "";
        break;
      case '=':
        if (_firstNumber != "" && _operator != "") {
          final secondNumber = double.parse(_textController.text);
          final result = _calculate(_firstNumber, _operator, secondNumber);
          _textController.text = result.toString();
          _firstNumber = "";
          _operator = "";
        }
        break;
      case 'C':
        _textController.text = "";
        _firstNumber = "";
        _operator = "";
        break;
      default:
        _textController.text += value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _textController.text,
                    style: const TextStyle(fontSize: 24.0),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('+'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('0'),
              _buildButton('C'),
              _buildButton('/'),
              _buildButton('='),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _updateText(value),
        child: Text(value),
      ),
    );
  }

  double _calculate(String firstNumber, String operator, double secondNumber) {
    switch (operator) {
      case '+':
        return double.parse(firstNumber) + secondNumber;
      case '-':
        return double.parse(firstNumber) - secondNumber;
      case '*':
        return double.parse(firstNumber) * secondNumber;
      case '/':
        return double.parse(firstNumber) / secondNumber;
      default:
        return 0.0; // Handle invalid operator
    }
  }

  Widget _calButn(String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          _updateText(value);
        },
        child: Text(value),
      ),
    );
  }
}
