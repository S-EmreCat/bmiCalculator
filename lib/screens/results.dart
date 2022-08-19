import '../utility/padding_class.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ResultScreen extends StatefulWidget {
  const ResultScreen(
      {Key? key,
      required this.currentHeight,
      required this.currentGender,
      required this.currentAge,
      required this.currentWeight})
      : super(key: key);

  final double currentHeight;
  final String currentGender;
  final int currentWeight;
  final int currentAge;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  // final double bmi;
  late String result;
  double bmiResult = 0.0;

  @override
  void initState() {
    super.initState();
    bmiResult = widget.currentWeight / pow(widget.currentHeight / 100, 2);
    bmiCalculator();
  }

  String bmiCalculator() {
    if (bmiResult >= 25) {
      result = "Overweight";
    } else if (bmiResult >= 18.5) {
      result = "Normal weight";
    } else {
      result = "Underweight";
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    double pagewidth = MediaQuery.of(context).size.width;
    double pageheight = MediaQuery.of(context).size.height;
    const String recalculate = "Recalculate";

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Column(children: [
          const Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          Expanded(
            flex: 7,
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: MyPaddingClass.largePadding,
                    child: resultTextMethod(context),
                  ),
                  Padding(
                    padding: MyPaddingClass.bottomPadding20,
                    child: Column(
                      children: [
                        //height
                        textMethod(widget.currentGender, context),
                        textMethod(widget.currentAge.toString(), context),
                      ],
                    ),
                  ),
                  Padding(
                    padding: MyPaddingClass.bottomPadding20,
                    child: textMethod("BMI", context),
                  ),
                  Padding(
                      padding: MyPaddingClass.bottomPadding20,
                      child: textMethod(result, context)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: MyPaddingClass.largePadding,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: pageheight * 0.08,
                  width: pagewidth,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(recalculate),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Text resultTextMethod(BuildContext context) {
    return Text(
      "Results",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: Theme.of(context).textTheme.headline2!.fontSize),
    );
  }

  Text textMethod(String result, BuildContext context) {
    return Text(
      result,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: Theme.of(context).textTheme.headline4!.fontSize),
    );
  }
}
