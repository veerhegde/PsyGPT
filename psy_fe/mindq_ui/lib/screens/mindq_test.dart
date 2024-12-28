import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class MindqTest extends StatelessWidget {
  const MindqTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assets/qdnim.png'),
              SvgPicture.asset('lib/assets/mindq_logo.svg', width: 100, height: 100, color: Colors.red,),
              const SizedBox(height: 50),
              Text(
                    style: TextStyle(
                      color: Colors.red
                    ),
                    "Answer the following questions"),
              const SizedBox(height: 40),
              _buildSlider(
                  "are you introvert or extrovert ?", SimpleSlider(divisions: 5)),
              _buildSlider(
                  "Paddle Thumb Overlay",
                  CustomThumbShape(
                      valueIndicatorShape: PaddleSliderValueIndicatorShape()))
            ]),
      ),
    );
  }

  Widget _buildSlider(String title, Widget child) {
    return SizedBox(
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[Text(
              style:TextStyle(
                fontFamily: "Arial",
                fontSize: 20
              ),title), child, Divider()]),
    );
  }
}

class SimpleSlider extends StatefulWidget {
  final Color? thumbColor;
  final int? divisions;

  const SimpleSlider(
      {Key? key,
        this.thumbColor,
        this.divisions})
      : super(key: key);

  @override
  _SimpleSliderState createState() => _SimpleSliderState();
}

class _SimpleSliderState extends State<SimpleSlider> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 100,
      label: _currentSliderValue.toInt().toString(),
      thumbColor: widget.thumbColor,
      divisions: widget.divisions,
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}

class CustomThumbShape extends StatelessWidget {
  final SliderComponentShape valueIndicatorShape;
  const CustomThumbShape({Key? key, required this.valueIndicatorShape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data: SliderTheme.of(context)
            .copyWith(valueIndicatorShape: valueIndicatorShape),
        child: SimpleSlider(divisions: 100));
  }
}
