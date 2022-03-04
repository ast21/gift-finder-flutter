import 'package:flutter/material.dart';

class Finder extends StatefulWidget {
  const Finder({Key? key}) : super(key: key);

  @override
  State<Finder> createState() => _FinderState();
}

class _FinderState extends State<Finder> {
  var _gender = 'M';
  RangeValues _priceValues = const RangeValues(501, 10000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Кому дарим подарок?'),
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Radio(
                            groupValue: _gender,
                            onChanged: (value) => {
                                  setState(() {
                                    _gender = value.toString();
                                  })
                                },
                            value: 'M'),
                        const Text('Мужской'),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Radio(
                            groupValue: _gender,
                            onChanged: (value) => {
                                  setState(() {
                                    _gender = value.toString();
                                  })
                                },
                            value: 'F'),
                        const Text('Женский'),
                      ],
                    ))
                  ],
                ),
                const TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Возраст')),
                const TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Выберите хобби')),
                Row(
                  children: const [
                    Expanded(
                        child: TextField(
                            decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'от 500 ₽'))),
                    Expanded(
                        child: TextField(
                            decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'до 10000 ₽'))),
                  ],
                ),
                RangeSlider(
                  values: _priceValues,
                  max: 10000,
                  min: 500,
                  divisions: 19,
                  labels: RangeLabels(
                    _priceValues.start.round().toString(),
                    _priceValues.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _priceValues = values;
                    });
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
