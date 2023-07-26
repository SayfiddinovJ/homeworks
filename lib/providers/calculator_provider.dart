import 'package:flutter/material.dart';

class CalculatorProvider with ChangeNotifier {
  dynamic _result;

  CalculatorProvider({required int result}) : _result = result;

  get getNumber => _result;

  set setNumber(int result) {
    _result = result;
  }

  void addition(int a, int b) {
    _result = a + b;
    notifyListeners();
  }

  void subtract(int a, int b) {
    _result = a - b;
    notifyListeners();
  }
  void multiply(int a, int b) {
    _result = a * b;
    notifyListeners();
  }
  void divide(int a, int b) {
    double number = a / b;
    _result = number.toStringAsFixed(2);
    notifyListeners();
  }
  void arithmetic(int a, int b) {
    List<int> number = [a,b];
    _result = number.reduce((value, element) => value+element) / number.length;
    notifyListeners();
  }
  void clear() {
    _result = 0;
    notifyListeners();
  }
}
