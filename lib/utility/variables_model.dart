// ignore_for_file: public_member_api_docs, sort_constructors_first
class BMIVariablesModel {
  int? age;
  double? heightDouble;
  int? heightInt;
  String? gender;
  int? weightInt;

  BMIVariablesModel(
      {this.age,
      this.gender,
      this.heightInt,
      this.heightDouble,
      this.weightInt});

  BMIVariablesModel copyWith({
    int? age,
    double? heighttestdouble,
    int? heightInt,
    String? gender,
    int? weightInt,
  }) {
    return BMIVariablesModel(
      age: age ?? age,
      heightDouble: heighttestdouble ?? heightDouble,
      heightInt: heightInt ?? heightInt,
      gender: gender ?? gender,
      weightInt: weightInt ?? weightInt,
    );
  }
}
