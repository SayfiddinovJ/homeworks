import 'package:rxdart/rxdart.dart';

class MultiplicationController {
   BehaviorSubject<int> resultSubject = BehaviorSubject<int>();
   final number1Controller = BehaviorSubject<int>();
   final number2Controller = BehaviorSubject<int>();

   Stream<int> multiplyNumbers() {
    int result = number1Controller.value * number2Controller.value;
    resultSubject.sink.add(result);
    return resultSubject.stream;
  }
}
