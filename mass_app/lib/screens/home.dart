import 'package:mass_app/widgets/left_bar.dart';
import 'package:mass_app/widgets/right_bar.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    // ignore: prefer_const_constructors
                    child: TextField(
                      controller: _heightController,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Height",
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white)),
                    ),
                  ),
                  Container(
                    width: 130,
                    // ignore: prefer_const_constructors
                    child: TextField(
                      controller: _weightController,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Weight",
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);

                  setState(() {
                    _bmiResult = _w / (_h * _h);
                    if (_bmiResult > 25) {
                      _textResult = "You\'re over weight";
                    } else if (_bmiResult <= 25) {
                      _textResult = "You have normal weight";
                    } else {
                      _textResult = "You\'re under weight";
                    }
                  });
                },
                child: const Text("Calculate",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow)),
              ),
              const SizedBox(height: 50),
              Container(
                child: Text(_bmiResult.toStringAsFixed(2),
                    style: TextStyle(fontSize: 90, color: Colors.yellow)),
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                  visible: _textResult.isNotEmpty,
                  child: Container(
                    child: Text(_textResult,
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Colors.yellow)),
                  )),
              SizedBox(height: 10),
              LeftBar(barWidth: 40),
              SizedBox(height: 20),
              LeftBar(barWidth: 70),
              SizedBox(height: 20),
              LeftBar(barWidth: 40),
              SizedBox(height: 30),
              RightBar(barWidth: 80),
              SizedBox(height: 20),
              RightBar(barWidth: 70),
            ],
          ),
        ));
  }
}
