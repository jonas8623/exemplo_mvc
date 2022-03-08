
import 'package:example_imc/model/person.dart';
import 'package:flutter/cupertino.dart';

class PersonController extends ChangeNotifier {

  double _height = 0.0;
  double _weight = 0.0;
  String result = '';

  void setHeight(String value) => _height = double.tryParse(value) ?? 0;
  void setWeight(String value) => _weight = double.tryParse(value) ?? 0;

  void getIMC() {
    final imcValue = Person(height: _height, weight: _weight).calculateIMC();
    final imcText = imcValue.toStringAsFixed(1);

    if(imcValue < 18) {
      result = 'O IMC é: $imcText, está magro';
    } else if(imcValue > 18 && imcValue < 24) {
      result = 'O IMC é: $imcText, você está bem';
    } else {
      result = 'O IMC é: $imcText, você tem que se cuidar mais';
    }
    notifyListeners();
  }

}