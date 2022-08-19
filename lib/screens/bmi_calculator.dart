import 'package:flutter/material.dart';

import '../utility/constants.dart';
import '../utility/padding_class.dart';
import '../utility/variables_model.dart';
import 'results.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  late MyPaddingClass padClass;
  final TextEditingController textController = TextEditingController();

  bool isClickedMale = true;
  bool isClickedFemale = false;

  var user = BMIVariablesModel();
  void weightAdd() {
    ConstantsAll.weightNumber += 1;
    setState(() {
      user.weightInttest = ConstantsAll.weightNumber;
    });
  }

  void weightRemove() {
    ConstantsAll.weightNumber -= 1;
    setState(() {
      user.weightInttest = ConstantsAll.weightNumber;
    });
  }

  void ageAdd() {
    ConstantsAll.ageNumber += 1;
    setState(() {
      user.agetest = ConstantsAll.ageNumber;
    });
  }

  void ageRemove() {
    ConstantsAll.ageNumber -= 1;
    setState(() {
      user.agetest = ConstantsAll.ageNumber;
    });
  }

  void genderClick(String genderStringFunText) {
    if (genderStringFunText == ConstantsAll.male) {
      isClickedFemale = false;
      isClickedMale = true;
      setState(() {});
      user.genderTest = ConstantsAll.male;
    } else if (genderStringFunText == ConstantsAll.female) {
      user.genderTest = ConstantsAll.female;
      isClickedFemale = true;
      isClickedMale = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    padClass = MyPaddingClass();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(ConstantsAll.titleAppBar),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: genderWidget(),
            ),
            Expanded(
              flex: 7,
              child: weightAgeWidget(),
            ),
            Expanded(
              flex: 8,
              child: heightWidget(),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: MyPaddingClass.horizontalPadding,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: calculateButton(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton calculateButton(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                gelenAge: user.agetest ?? 18,
                gelenWeight: user.weightInttest ?? 65,
                gelenGender: user.genderTest ?? "Male",
                gelenHeight: user.heighttestdouble ?? 160,
              ),
            ),
          );
        },
        child: Text(
          ConstantsAll.calculateButtonText,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Theme.of(context).textTheme.headline4!.fontSize),
        ));
  }

  Widget genderWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: genderButton(
              Icons.female_outlined, ConstantsAll.female, isClickedFemale),
        ),
        Expanded(
          child: genderButton(
              Icons.male_outlined, ConstantsAll.male, isClickedMale),
        ),
      ],
    );
  }

  Widget genderButton(IconData genderIcon, String gender, bool buttonClick) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Card(
        child: ElevatedButton.icon(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  buttonClick ? Colors.lightBlue : Colors.indigo)),
          onPressed: () {
            genderClick(gender);
          },
          icon: Icon(
            genderIcon,
            size: 50,
          ),
          label: Text(
            gender,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  Widget heightWidget() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.lightBlue,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: MyPaddingClass.topPadding20,
                      child: heightTextMethod(context),
                    ),
                  ),
                  Expanded(
                    child: cmAreaMethod(context),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: MyPaddingClass.bottomPadding10,
                child: Align(
                  alignment: Alignment.center,
                  child: sliderWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Slider sliderWidget() {
    return Slider(
        value: ConstantsAll.currentValue,
        activeColor: Colors.white,
        inactiveColor: Colors.blueGrey,
        thumbColor: Colors.indigo,
        max: ConstantsAll.maxSlider,
        min: ConstantsAll.min2Slider,
        label: "value int",
        onChanged: (double value) {
          setState(() {
            ConstantsAll.currentValue = value;
            user.heighttestdouble = ConstantsAll.currentValue;
            debugPrint(user.heighttestdouble.toString());
          });
        });
  }

  Text heightTextMethod(BuildContext context) {
    return Text(
      ConstantsAll.heightText,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Theme.of(context).primaryColor,
          ),
    );
  }

  RichText cmAreaMethod(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: ConstantsAll.currentValue.toInt().toString(),
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.headline4!.fontSize),
        children: [
          TextSpan(
            text: ConstantsAll.cmText,
            style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: Theme.of(context).textTheme.headline6!.fontSize),
          ),
        ],
      ),
    );
  }

  Widget weightAgeWidget() {
    return Row(
      children: [
        Expanded(
          child: weightControll(ConstantsAll.weightNumber, ConstantsAll.weight,
              weightRemove, weightAdd),
        ),
        Expanded(
          child: weightControll(
              ConstantsAll.ageNumber, ConstantsAll.age, ageRemove, ageAdd),
        ),
      ],
    );
  }

  Widget weightControll(int number, String controllText, VoidCallback removeFun,
      VoidCallback addFun) {
    return Card(
      color: Colors.lightBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          titleWidget(controllText),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              removeButton(removeFun, controllText),
              counterControllWidget(number),
              addButton(addFun, controllText),
            ],
          )
        ],
      ),
    );
  }

  Text counterControllWidget(int number) {
    return Text(
      "$number",
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Theme.of(context).primaryColor,
          ),
    );
  }

  Text titleWidget(String controllText) {
    return Text(
      controllText,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Theme.of(context).primaryColor,
          ),
    );
  }

//TODO: BUTTON BOYUTLARINI KÜÇÜLT
  FloatingActionButton removeButton(
      VoidCallback removeFun, String controllText) {
    return FloatingActionButton(
      heroTag: "{$controllText}remove",
      backgroundColor: Colors.white,
      onPressed: () {
        removeFun();
      },
      child: const Icon(
        Icons.remove,
        color: Colors.lightBlue,
      ),
    );
  }

  FloatingActionButton addButton(VoidCallback addFun, String controllText) {
    return FloatingActionButton(
      heroTag: "{$controllText}add",
      backgroundColor: Colors.white,
      onPressed: () {
        addFun();
      },
      child: const Icon(
        Icons.add,
        color: Colors.lightBlue,
      ),
    );
  }
}
