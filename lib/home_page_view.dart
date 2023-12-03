import 'package:calculator_app/colors.dart';
import 'package:calculator_app/buttons_row.dart';
import 'package:calculator_app/calculator_bloc.dart';
import 'package:calculator_app/rounded_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF484848),
        title: Text("Calculator App"),
        centerTitle: true,
      ),
      body: BlocBuilder<CalculatorCubit, CalculatorState>(
        builder: (context, state) {
          return Container(
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.only(top: 5),
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xFF484848),
                  ),
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    state.displayValue.toString(),
                    style: TextStyle(color: operatorButtonColor),
                  ),
                ),
                const SizedBox(
                  height: 150,
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xFF484848),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: ButtonsRow(buttonList: [
                            RoundedIconWidget(
                                buttonColor: operatorButtonColor,
                                textColor: operatorTextColor,
                                text: "C",
                                function: () {
                                  context.read<CalculatorCubit>().cFunction();
                                }),
                            RoundedIconWidget(
                              buttonColor: operatorButtonColor,
                              textColor: operatorTextColor,
                              text: "%",
                              function: () {
                                context.read<CalculatorCubit>().check("%");
                              },
                            ),
                            RoundedIconWidget(
                              buttonColor: operatorButtonColor,
                              textColor: operatorTextColor,
                              text: "AC",
                              function: () =>
                                  context.read<CalculatorCubit>().clearAC(),
                            ),
                            RoundedIconWidget(
                              buttonColor: operatorButtonColor,
                              textColor: operatorTextColor,
                              text: "X",
                              function: () {
                                context.read<CalculatorCubit>().check("*");
                              },
                            ),
                          ]),
                        ),
                        Flexible(
                          child: ButtonsRow(buttonList: [
                            RoundedIconWidget(
                              buttonColor: numberButtonColor,
                              textColor: numberTextColor,
                              text: "7",
                              function: () =>
                                  context.read<CalculatorCubit>().number(7),
                            ),
                            RoundedIconWidget(
                              buttonColor: numberButtonColor,
                              textColor: numberTextColor,
                              text: "8",
                              function: () =>
                                  context.read<CalculatorCubit>().number(8),
                            ),
                            RoundedIconWidget(
                              buttonColor: numberButtonColor,
                              textColor: numberTextColor,
                              text: "9",
                              function: () =>
                                  context.read<CalculatorCubit>().number(9),
                            ),
                            RoundedIconWidget(
                              buttonColor: operatorButtonColor,
                              textColor: operatorTextColor,
                              text: "/",
                              function: () {
                                context.read<CalculatorCubit>().check("/");
                              },
                            ),
                          ]),
                        ),
                        Flexible(
                          child: ButtonsRow(buttonList: [
                            RoundedIconWidget(
                              buttonColor: numberButtonColor,
                              textColor: numberTextColor,
                              text: "4",
                              function: () =>
                                  context.read<CalculatorCubit>().number(4),
                            ),
                            RoundedIconWidget(
                              buttonColor: numberButtonColor,
                              textColor: numberTextColor,
                              text: "5",
                              function: () =>
                                  context.read<CalculatorCubit>().number(5),
                            ),
                            RoundedIconWidget(
                              buttonColor: numberButtonColor,
                              textColor: numberTextColor,
                              text: "6",
                              function: () =>
                                  context.read<CalculatorCubit>().number(6),
                            ),
                            RoundedIconWidget(
                              buttonColor: operatorButtonColor,
                              textColor: operatorTextColor,
                              text: "-",
                              function: () {
                                context.read<CalculatorCubit>().check("-");
                              },
                            ),
                          ]),
                        ),
                        Flexible(
                          child: ButtonsRow(buttonList: [
                            RoundedIconWidget(
                              buttonColor: numberButtonColor,
                              textColor: numberTextColor,
                              text: "1",
                              function: () =>
                                  context.read<CalculatorCubit>().number(1),
                            ),
                            RoundedIconWidget(
                              buttonColor: numberButtonColor,
                              textColor: numberTextColor,
                              text: "2",
                              function: () =>
                                  context.read<CalculatorCubit>().number(2),
                            ),
                            RoundedIconWidget(
                              buttonColor: numberButtonColor,
                              textColor: numberTextColor,
                              text: "3",
                              function: () =>
                                  context.read<CalculatorCubit>().number(3),
                            ),
                            RoundedIconWidget(
                              buttonColor: operatorButtonColor,
                              textColor: operatorTextColor,
                              text: "+",
                              function: () {
                                context.read<CalculatorCubit>().check("+");
                              },
                            ),
                          ]),
                        ),
                        Flexible(
                          child: ButtonsRow(buttonList: [
                            RoundedIconWidget(
                              buttonColor: numberButtonColor,
                              textColor: numberTextColor,
                              text: "0",
                              function: () =>
                                  context.read<CalculatorCubit>().number(0),
                            ),
                            RoundedIconWidget(
                              buttonColor: numberButtonColor,
                              textColor: numberTextColor,
                              text: ".",
                              function: () {
                                context.read<CalculatorCubit>().number(".");
                              },
                            ),
                            RoundedIconWidget(
                              buttonColor: operatorButtonColor,
                              textColor: operatorTextColor,
                              text: "=",
                              function: () {
                                context.read<CalculatorCubit>().equalSign();
                              },
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
