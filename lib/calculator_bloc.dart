import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit(super.initialState);

  void cFunction() {
    var displayValue = state.displayValue.toString();
    print(displayValue);
    var displayValueLength = displayValue.length;
    print(displayValueLength);
    var lastCharacter =
        displayValue.substring(displayValueLength - 1, displayValueLength);
    try {
      var lastCharacterType = double.parse(lastCharacter).runtimeType;

      print(lastCharacterType);

      emit(
        CalculatorState(
          operatorValue: state.operatorValue,
          bufferNumber: state.bufferNumber
              .toString()
              .substring(0, state.bufferNumber.toString().length - 1),
          displayValue: state.displayValue
              .toString()
              .substring(0, state.displayValue.toString().length - 1),
          result: state.result
              .toString()
              .substring(0, state.result.toString().length - 1),
          isFirstOperator: state.isFirstOperator,
        ),
      );
    } catch (e) {
      print("operator");
      var bufferNumber = state.bufferNumber.toString();
      var bufferNumberLength = bufferNumber.length;
      var newSubstring = bufferNumber.substring(0, bufferNumberLength - 1);
      print(
          "buffer ${bufferNumber} length ${bufferNumberLength} newString ${newSubstring}");
      emit(
        CalculatorState(
          operatorValue: "",
          bufferNumber: newSubstring,
          displayValue: newSubstring,
          result: newSubstring,
          isFirstOperator: true,
        ),
      );
    }
  }

  void number(value) {
    emit(CalculatorState(
      firstNumber: state.firstNumber,
      operatorValue: state.operatorValue,
      bufferNumber: state.bufferNumber! + value.toString(),
      displayValue: state.displayValue! + value.toString(),
      isFirstOperator: state.isFirstOperator,
    ));
  }

  void check(value) {
    if (state.isFirstOperator == true) {
      print("is first operator ${state.isFirstOperator}");
      operatorFunction(value);
      return;
    }
    print("is not first operator ${state.isFirstOperator}");
    calculate(value);
  }

  String? validateString(value) {
    try {
      var isNumber = double.parse(value);
      var type = isNumber.runtimeType;
      print(type);
      return "incomplete";
    } catch (e) {
      print("has operator");
      return checkOperator(value);
    }
  }

  String? checkOperator(value) {
    var operatorList = ["+", "-", "*", "/", "%"];
    for (int index = 0; index < operatorList.length; index++) {
      try {
        var hasOperator = value.toString().indexOf(operatorList[index]);
        if (hasOperator < 0) {
          continue;
        }
        print("doe sit have this operator ${hasOperator}");
        var bufferList = value.toString().split(operatorList[index]);
        print("operator to test is ${operatorList[index]}");
        print("success");
        print(bufferList);
        if (bufferList.length < 2) {
          print("lngth less than 2");
          return "incomplete";
        }
        print("complete");
        return "complete";
      } catch (e) {
        print("operator not for this round");
        continue;
      }
    }
    return "complete";
  }

  void equalSign() {
    var value = state.displayValue;
    print(state.displayValue);
    print('value is ${value}');
    String? validation = validateString(value);
    print('validation ${validation}');
    if (validation == "incomplete") {
      emit(
        CalculatorState(
          displayValue: state.displayValue,
          bufferNumber: state.displayValue,
          result: state.displayValue,
          isFirstOperator: true,
          operatorValue: "",
        ),
      );
      return;
    }
    var actualOperator = state.operatorValue;
    check(actualOperator);
    var displayValue = state.displayValue
        .toString()
        .substring(0, state.displayValue.toString().length - 1);
    emit(
      CalculatorState(
        displayValue: displayValue,
        bufferNumber: displayValue,
        result: displayValue,
        isFirstOperator: true,
        operatorValue: "",
      ),
    );
  }

  void calculate(value) {
    var operatorValue = state.operatorValue;
    var bufferNumber = state.bufferNumber.toString();
    var bufferArray = [];

    switch (operatorValue) {
      case "+":
        bufferArray = bufferNumber.split("+");
        print(bufferArray);
        sum(bufferArray, value);
      case "-":
        bufferArray = bufferNumber.split("-");
        print(bufferArray);
        subtract(bufferArray, value);
      case "*":
        bufferArray = bufferNumber.split("*");
        print(bufferArray);
        multiply(bufferArray, value);
      case "/":
        bufferArray = bufferNumber.split("/");
        print(bufferArray);
        divide(bufferArray, value);
      case "%":
        bufferArray = bufferNumber.split("%");
        print(bufferArray);
        getPercentage(bufferArray, value);
    }
  }

  void sum(bufferArray, value) {
    var result = double.parse(bufferArray[0]) + double.parse(bufferArray[1]);
    print(result);
    print(value);
    print(state.operatorValue);

    emit(
      CalculatorState(
        result: result.toString() + value,
        bufferNumber: result.toString() + value,
        operatorValue: value,
        displayValue: result.toString() + value,
        isFirstOperator: false,
      ),
    );
  }

  void subtract(bufferArray, value) {
    var result = double.parse(bufferArray[0]) - double.parse(bufferArray[1]);
    print(result);
    print(value);
    print(state.operatorValue);

    emit(
      CalculatorState(
        result: result.toString() + value,
        bufferNumber: result.toString() + value,
        operatorValue: value,
        displayValue: result.toString() + value,
        isFirstOperator: false,
      ),
    );
  }

  void multiply(bufferArray, value) {
    var result = double.parse(bufferArray[0]) * double.parse(bufferArray[1]);
    print(result);
    print(value);
    print(state.operatorValue);

    emit(
      CalculatorState(
        result: result.toString() + value,
        bufferNumber: result.toString() + value,
        operatorValue: value,
        displayValue: result.toString() + value,
        isFirstOperator: false,
      ),
    );
  }

  void divide(bufferArray, value) {
    var result = double.parse(bufferArray[0]) / double.parse(bufferArray[1]);
    print(result);
    print(value);
    print(state.operatorValue);

    emit(
      CalculatorState(
        result: result.toString() + value,
        bufferNumber: result.toString() + value,
        operatorValue: value,
        displayValue: result.toString() + value,
        isFirstOperator: false,
      ),
    );
  }

  void getPercentage(bufferArray, value) {
    var result = double.parse(bufferArray[0]) % double.parse(bufferArray[1]);
    print(result);
    print(value);
    print(state.operatorValue);

    emit(
      CalculatorState(
        result: result.toString() + value,
        bufferNumber: result.toString() + value,
        operatorValue: value,
        displayValue: result.toString() + value,
        isFirstOperator: false,
      ),
    );
  }

  void operatorFunction(value) {
    emit(CalculatorState(
      firstNumber: state.firstNumber,
      operatorValue: value,
      bufferNumber: state.bufferNumber! + value.toString(),
      displayValue: state.displayValue! + value.toString(),
      isFirstOperator: false,
    ));
  }

  void clearAC() {
    emit(CalculatorState.empty());
  }
}

class CalculatorState extends Equatable {
  CalculatorState({
    this.bufferNumber = "",
    this.firstNumber = "",
    this.secondNumber = "",
    this.displayValue = "",
    this.operatorValue = "",
    this.result = "",
    this.isFirstOperator = true,
  });

  final dynamic bufferNumber;
  final dynamic displayValue;
  final dynamic firstNumber;
  final dynamic secondNumber;
  final dynamic operatorValue;
  final dynamic result;
  final bool isFirstOperator;

  CalculatorState.empty()
      : this(
          bufferNumber: "",
          displayValue: "",
          firstNumber: "",
          secondNumber: "",
          operatorValue: "",
          result: "",
          isFirstOperator: true,
        );

  @override
  List<Object?> get props => [
        bufferNumber,
        displayValue,
        firstNumber,
        secondNumber,
        operatorValue,
        result,
      ];
}
