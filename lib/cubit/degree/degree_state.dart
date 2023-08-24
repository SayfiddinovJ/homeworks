import 'dart:math';

class DegreeState {
  int a;
  int b;
  num result;

  DegreeState({
    this.result = 0,
    this.a = 0,
    this.b = 0,
  });

  DegreeState copyWith({
    int? a,
    int? b,
    num? result,
  }) =>
      DegreeState(
        a: a ?? this.a,
        b: b ?? this.b,
        result: result ?? this.result,
      );


 @override
  String toString() {
   result = pow(a, b);
    return """
    Result: $result
    result: ${pow(a, b)}
    """;
  }
}