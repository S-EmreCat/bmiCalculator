// ignore_for_file: public_member_api_docs, sort_constructors_first
class BMIVariablesModel {
  int? agetest;
  double? heighttestdouble;
  int? heightInttest;
  String? genderTest;
  int? weightInttest;

  BMIVariablesModel(
      {this.agetest,
      this.genderTest,
      this.heightInttest,
      this.heighttestdouble,
      this.weightInttest});

  BMIVariablesModel copyWith({
    int? agetest,
    double? heighttestdouble,
    int? heightInttest,
    String? genderTest,
    int? weightInttest,
  }) {
    return BMIVariablesModel(
      agetest: agetest ?? this.agetest,
      heighttestdouble: heighttestdouble ?? this.heighttestdouble,
      heightInttest: heightInttest ?? this.heightInttest,
      genderTest: genderTest ?? this.genderTest,
      weightInttest: weightInttest ?? this.weightInttest,
    );
  }
}
