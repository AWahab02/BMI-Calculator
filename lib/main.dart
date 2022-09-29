import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final TextEditingController _heightController = new TextEditingController();
final TextEditingController _weightController = new TextEditingController();
double _result=0;
String _resultstring="";

class MyApp extends StatefulWidget
{
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff041c44),
          title: const Align(
            alignment: Alignment.center,
            child: Text('BMI Calculator'),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(padding:const EdgeInsets.only(top:20),
                child: TextFormField(
                  controller: _weightController,
                  decoration: InputDecoration(
                    fillColor: const Color(0xFFFFFFFF),
                    hintText: 'Enter your weight (in kgs)',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffE4E7E8)),
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
              ),

              Padding(padding:const EdgeInsets.only(top:20),
                child: TextFormField(
                  controller: _heightController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your height (in cm)',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(padding:const  EdgeInsets.only(top:15),
                child: OutlinedButton(
                  onPressed: CalculateBMI,
                  style: OutlinedButton.styleFrom(

                    side:const BorderSide(
                      width: 1,
                      color: Colors.black,
                      style: BorderStyle.solid,
                    )
                  ),
                  child: Text("Calculate BMI",
                  style: new TextStyle(
                    color: Colors.black,
                  )),
                ),
              ),

              const SizedBox(height: 15),
              Text(
                'Your BMI is:',
                style: new TextStyle(
                  color: Color(0xff041c44),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Text(
                _result==null?"Enter Value": "${_result.toStringAsFixed(2)}",
                style: new TextStyle(
                  color: Color(0xff041c44),
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Center(
                child: Text(
                  _resultstring,
                  style: new TextStyle(
                    color: Color(0xff041c44),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )


            ],
          ),
        )

      ),
    );
  }

  void CalculateBMI()
  {
    double height = double.parse(_heightController.text) /100;
    double weight = double.parse(_weightController.text);

    double heightSquare=height*height;
    double result=weight/heightSquare;


    if(result<18.5)
    {
        _resultstring="You are underweight.";
    }
    else if(result>=18.5 && result<=24.9)
    {
        _resultstring="Your weight is healthy.";
    }
    else if(result>=25.0 && result<=29.9)
    {
        _resultstring="You are overweight.";
    }
    else if(result>=30.0)
    {
        _resultstring="You are obese.";
    }


    _result=result;
    setState(() {});

  }

}
