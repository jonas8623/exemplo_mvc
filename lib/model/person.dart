
class Person {

  final double height;
  final double weight;

  Person({required this.height, required this.weight});

  double calculateIMC() => weight / (height * height);

}