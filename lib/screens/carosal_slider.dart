import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CarosalSlider extends StatefulWidget {
  const CarosalSlider({super.key});

  @override
  State<CarosalSlider> createState() => _CarosalSliderState();
}

class _CarosalSliderState extends State<CarosalSlider> {
  //  var _currentValue = 0;
  @override
  Widget build(BuildContext context) {
    var _currentValue;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.amber,
        child: Container(
          child: Slider(
            // var _currentValue = 0;
            value: _currentValue,
            min: 0,
            max: 100,
            onChanged: (double value) {
              setState(() {
                _currentValue = value;
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            thumbColor: Colors.red,
            // overlayColor: Colors.blue.withOpacity(0.2),
            divisions: 10,
            label: '$_currentValue',
          ),
        ),
      ),
    );
  }
}
