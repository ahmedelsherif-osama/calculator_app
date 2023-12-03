import 'package:calculator_app/rounded_icon_widget.dart';
import 'package:flutter/material.dart';

class ButtonsRow extends StatelessWidget {
  ButtonsRow({required this.buttonList});

  List<RoundedIconWidget> buttonList = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: buttonList.length,
        itemBuilder: (context, index) {
          return RoundedIconWidget(
            textColor: buttonList[index].textColor,
            buttonColor: buttonList[index].buttonColor,
            text: buttonList[index].text,
            function: buttonList[index].function,
          );
        },
      ),
    );
  }
}
