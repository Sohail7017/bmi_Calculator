
import 'package:flutter/material.dart';
import 'package:your_bmi/calculator_bmi.dart';

void main (){
  runApp(BmiCalculater());
}
class BmiCalculater extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorBmi(),
    );
  } 
}