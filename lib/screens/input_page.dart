import 'package:bmi/components/Icon_content.dart';
import 'package:bmi/components/Reusablecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/components/bottom_button.dart';
import 'package:bmi/components/roundicon_button.dart';
import 'package:bmi/constants.dart';
import 'results_page.dart';
import 'package:bmi/calculator_brain.dart';

enum Gender{  // Enums
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = kinactiveColor;
  Color femaleCardColor = kinactiveColor;
  int height =  180;
  int weight = 60;
  int age = 20;

  // 1 = male, 2 = female
  void updateColor(Gender selectedgender){
    if (selectedgender == Gender.male) {
      if (maleCardColor == kinactiveColor) {
        maleCardColor = kuseColor;
        femaleCardColor = kinactiveColor;
      }else{
        maleCardColor = kinactiveColor;
      }
      }
       if (selectedgender==Gender.female) {
        if (femaleCardColor == kinactiveColor) {
          femaleCardColor = kuseColor;
        maleCardColor = kinactiveColor;
        }
        else{
        femaleCardColor = kinactiveColor;
      }
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onpress: (){
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                    colour: maleCardColor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onpress: (){
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    colour: femaleCardColor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                )
              ],
            )),
            Expanded(
              child: ReusableCard(
                colour: kuseColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "HEIGHT",
                      style: klabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: knumberTextStyle,
                        ),
                        const Text(
                          "cm",
                          style: klabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: const Color(0xFFEB1555),
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                    )
                    
                    
                  ],
                ), onpress: (){}, 
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kuseColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: klabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: knumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    onpress: (){},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kuseColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: klabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: knumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    onpress: () {
                      
                    },
                  ),
                )
              ],
            )),
            BottomButton(
              buttonTitle: "CALCULATE",
              onTap: () {
                
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);


        Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(bmiResult: calc.calculateBMI(), resultText: calc.getResult(), interpretation: calc.getInterpretation(),)));
      },
            )
          ],
        ));
  }
}








