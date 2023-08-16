import 'dart:math';

class BmiCalculator {
  final int weight;
  final int height;
  double _bmi=0;
  BmiCalculator({required this.weight, required this.height}) {}
  String getresult() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBmi() {
    if (_bmi > 25) {
      return 'overweight';
    } else if (_bmi <= 25 && _bmi > 18) {
      return 'normal';
    } else
      return 'malnourished';
  }
  String getInter(){
    if (_bmi > 25) {
      return 'Kam Khaya Karo Wazan Zyada Hai';
    } else if (_bmi <= 25 && _bmi > 18) {
      return 'Wazan Theek hai khaayo peeyo aish karo';
    } else
      return 'Kuch Kha leya karo';

  }
}
