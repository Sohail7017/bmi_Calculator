
import 'dart:math';

import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class CalculatorBmi extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => CaculatorBmiState();

}
class CaculatorBmiState extends State<CalculatorBmi>{
  String result = "";
  var resultColor ;
  num bmi = 0.0 ;
  Color bgColor = Colors.white;
  String reactionImage = '';
  @override
  Widget build(BuildContext context) {
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(child: Text('BMI Calculator', style: TextStyle(fontSize: 25,color: Colors.white,fontFamily: 'MyFonts',fontWeight: FontWeight.bold),)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: bgColor,
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Text('Calculate your BMI',style: TextStyle(fontSize: 25,color: Colors.deepPurpleAccent,fontFamily: 'MyFonts',fontWeight: FontWeight.bold),),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 40,
              width: 350,
              child: TextField(
                controller: controller1,
                decoration: InputDecoration(
                  prefixIcon:  Icon(Icons.line_weight,size: 25,color: Colors.black26),
                  labelText: 'Weight in KG',
                  labelStyle: TextStyle(fontSize: 11,color: Colors.black,fontFamily: 'MyFonts',fontWeight: FontWeight.bold),
                  hintText: 'Enter your Weight',
                  hintStyle: TextStyle(fontSize: 15,color: Colors.black54,fontFamily: 'MyFonts'),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Colors.deepPurpleAccent,
                          width: 1
                      )
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: 350,
              child: TextField(
                controller: controller2,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.height,size: 25,color: Colors.black26),
                  labelText: 'Height in Fit',
                  labelStyle: TextStyle(fontSize: 12,color: Colors.black,fontFamily: 'MyFonts',fontWeight: FontWeight.bold),
                  hintText: 'Enter your Height',
                  hintStyle: TextStyle(fontSize: 15,color: Colors.black54,fontFamily: 'MyFonts'),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 1
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Colors.deepPurpleAccent,
                          width: 1
                      )
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: 350,
              child: TextField(
                controller: controller3,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.height,size: 25,color: Colors.black26),
                  labelText: 'Height in Inches',
                  labelStyle: TextStyle(fontSize: 12,color: Colors.black,fontFamily: 'MyFonts',fontWeight: FontWeight.bold),
                  hintText: 'Enter your Height',
                  hintStyle: TextStyle(fontSize: 15,color: Colors.black54,fontFamily: 'MyFonts'),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 1
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Colors.deepPurpleAccent,
                          width: 1
                      )
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 40,
                width: 350,
                child: ElevatedButton(onPressed: () {
                  num wt = double.parse(controller1.text.toString());
                  int ftHeight = int.parse(controller2.text.toString());
                  int inHeight = int.parse(controller3.text.toString());


                  int totalInch = (ftHeight * 12) + inHeight;
                  num tCm = 2.54 * totalInch;
                  num tMeter = tCm / 100;

                  bmi = wt / pow(tMeter, 2);

                  if (bmi > 25) {
                    resultColor = Color(0xffF70000);
                    result = 'Overweight!!';
                    bgColor = Colors.red.shade100;
                    reactionImage = 'assets/icons/over_weight.png';
                  } else if (bmi < 18) {
                    resultColor = Color(0xffF79B00);
                    result = 'Underweight!!';
                    bgColor = Colors.orange.shade100;
                    reactionImage = 'assets/icons/under_weight.png';
                  } else {
                    resultColor = Color(0xff085A35);
                    result = 'Healthy!!';
                    bgColor = Colors.green.shade100;
                    reactionImage = 'assets/icons/healthy.png';
                  }
                  setState(() {

                  });
                },

                  child: Text('Calculate',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'MtFonts'),),style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent))),

                          SizedBox(
                    height: 15,
                  ),
             bmi==0.0? Container() : Text('Your BMI is: ${bmi.toStringAsFixed(4)}',style: TextStyle(fontSize: 18,color: Colors.deepPurpleAccent,fontFamily: 'MyFonts',fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),

            reactionImage== ''? Container() : Image.asset(reactionImage,width: 270,height: 200),
            result==""? Container() : Text("$result",style: TextStyle(fontSize: 20,color: resultColor,fontFamily: 'MyFonts',fontWeight: FontWeight.bold),),


    ]




    )
    ),

    );
  }

}