import 'package:bmi/components/bottom_button.dart';
import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi/components/Reusablecard.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({super.key, required this.bmiResult, required this.resultText, required this.interpretation});
  
  final String bmiResult;
  final String resultText;
  final String interpretation;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 30,left: 20),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: ktitleTextstyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kuseColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      resultText.toUpperCase(),
                      style: kresultTextStyle,
                    ),
                  ),
                  Center(
                    child: Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kbodyTextStyle,
                  )
                ],
              ), onpress: () {  },
            ),
          ),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            buttonTitle: "RE-CALCULATE",
          ),

        ],
      )
    );
  }
}