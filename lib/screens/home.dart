// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmiResult = 0;
  String textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: heightController,
                    style: TextStyle(
                      fontSize: 42.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Height',
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 37.0,
                            fontWeight: FontWeight.w300)),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: weightController,
                    style: TextStyle(
                      fontSize: 42.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Weight',
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 37.0,
                            fontWeight: FontWeight.w300)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              onTap: () {
                double h = double.parse(heightController.text);
                double w = double.parse(weightController.text);
                setState(() {
                  bmiResult = w / (h * h);
                  if (bmiResult > 25) {
                    textResult = "You are overweight";
                  } else if (bmiResult >= 18.5 && bmiResult <= 25) {
                    textResult = "You have normal weight";
                  } else {
                    textResult = "You are underweight";
                  }
                });
              },
              child: Container(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              child: Text(
                bmiResult.toStringAsFixed(2),
                style: TextStyle(fontSize: 80.0, color: Colors.black),
              ),
            ),
            SizedBox(height: 30.0),
            Visibility(
              visible: textResult.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    textResult,
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            LeftBar(barWidth: 60.0),
            SizedBox(height: 20.0),
            LeftBar(barWidth: 40),
            SizedBox(height: 20.0),
            LeftBar(barWidth: 80),
            SizedBox(height: 100.0),
            RightBar(barWidth: 40),
            SizedBox(height: 20.0),
            RightBar(barWidth: 50),
            SizedBox(height: 20.0),
            RightBar(barWidth: 80.0),
          ],
        ),
      ),
    );
  }
}
