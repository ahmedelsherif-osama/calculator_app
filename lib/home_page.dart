import 'package:calculator_app/buttons_row.dart';
import 'package:calculator_app/calculator_bloc.dart';
import 'package:calculator_app/home_page_view.dart';
import 'package:calculator_app/rounded_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: HomePageView(),
      create: (context) =>
          CalculatorCubit(CalculatorState(displayValue: "", bufferNumber: "")),
    );
  }
}
