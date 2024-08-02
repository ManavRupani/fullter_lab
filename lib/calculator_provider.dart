import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorProvider with ChangeNotifier {
  String _output = "0";
  String _input = "";
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operand = "";

  String get output => _output;

  void buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      _input = "";
      _num1 = 0.0;
      _num2 = 0.0;
      _operand = "";
      _output = "0";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      if (_input.isNotEmpty) {
        _num1 = double.parse(_input);
      }
      _operand = buttonText;
      _input = "";
      _output = _num1.toString() + " " + _operand;
    } else if (buttonText == "%") {
      _num1 = double.parse(_input.isEmpty ? "0" : _input);
      _output = (_num1 / 100).toString();
      _input = _output;
    } else if (buttonText == "√") {
      _num1 = double.parse(_input.isEmpty ? "0" : _input);
      _output = sqrt(_num1).toString();
      _input = _output;
    } else if (buttonText == "x²") {
      _num1 = double.parse(_input.isEmpty ? "0" : _input);
      _output = (_num1 * _num1).toString();
      _input = _output;
    } else if (buttonText == "sin") {
      _num1 = double.parse(_input.isEmpty ? "0" : _input);
      _output = sin(_num1 * pi / 180).toString();
      _input = _output;
    } else if (buttonText == "cos") {
      _num1 = double.parse(_input.isEmpty ? "0" : _input);
      _output = cos(_num1 * pi / 180).toString();
      _input = _output;
    } else if (buttonText == "tan") {
      _num1 = double.parse(_input.isEmpty ? "0" : _input);
      _output = tan(_num1 * pi / 180).toString();
      _input = _output;
    } else if (buttonText == "log") {
      _num1 = double.parse(_input.isEmpty ? "0" : _input);
      _output = (log(_num1) / log(10)).toString();
      _input = _output;
    } else if (buttonText == "ln") {
      _num1 = double.parse(_input.isEmpty ? "0" : _input);
      _output = log(_num1).toString();
      _input = _output;
    } else if (buttonText == ".") {
      if (!_input.contains(".")) {
        _input += buttonText;
      }
      _output = _input;
    } else if (buttonText == "=") {
      _num2 = double.parse(_input.isEmpty ? "0" : _input);

      if (_operand == "+") {
        _output = (_num1 + _num2).toString();
      } else if (_operand == "-") {
        _output = (_num1 - _num2).toString();
      } else if (_operand == "*") {
        _output = (_num1 * _num2).toString();
      } else if (_operand == "/") {
        if (_num2 != 0) {
          _output = (_num1 / _num2).toString();
        } else {
          _output = "Error";
        }
      }

      _num1 = 0.0;
      _num2 = 0.0;
      _operand = "";
      _input = _output;
    } else {
      // Handle number and dot input
      if (_operand.isEmpty) {
        // If there's no operand yet, just update the input
        _input += buttonText;
        _output = _input;
      } else {
        // If there's an operand, append the digit to the input
        _input += buttonText;
        _output = "${_num1} ${_operand} ${_input}";
      }
    }

    notifyListeners();
  }
}
