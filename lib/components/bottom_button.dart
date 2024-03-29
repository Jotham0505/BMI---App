import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';


class BottomButton extends StatelessWidget {

  BottomButton({required this.onTap, required this.buttonTitle});

  final Function() onTap;
  final String buttonTitle;
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        padding: EdgeInsets.only(bottom: 20),
        color: kBottomContainercolor,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kbottomHeight,
      ),
    );
  }
}