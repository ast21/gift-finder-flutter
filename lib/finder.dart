import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Label extends StatelessWidget {
  const Label(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 16, bottom: 8),
        child: Text(
          text,
          style: const TextStyle(height: 1.15),
        ));
  }
}

class Header extends StatelessWidget {
  const Header(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
    );
  }
}

class Input extends StatelessWidget {
  const Input(this.placeholder, {Key? key}) : super(key: key);

  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: const TextStyle(
          height: 1,
        ),
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          hintText: placeholder,
          isDense: true,
          contentPadding: const EdgeInsets.only(top: 13, bottom: 13, left: 12),
        ));
  }
}

class Finder extends StatefulWidget {
  const Finder({Key? key}) : super(key: key);

  @override
  State<Finder> createState() => _FinderState();
}

class _FinderState extends State<Finder> {
  var _gender = 'Male';
  SfRangeValues _sfPriceValues = const SfRangeValues(500, 10000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              const Header('Кому дарим подарок?'),
              Container(padding: const EdgeInsets.only(left: 8), child: Image.asset('assets/images/present28x28.png'))
            ],
          ),
          const Label('Пол'),
          Row(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Transform.scale(
                    scale: 1.15,
                    child: Radio(
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        groupValue: _gender,
                        onChanged: (value) => {
                              setState(() {
                                _gender = value.toString();
                              })
                            },
                        value: 'Male'),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: const Text('Мужской'),
                  ),
                ],
              )),
              Expanded(
                  child: Row(
                children: [
                  Transform.scale(
                    scale: 1.15,
                    child: Radio(
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        groupValue: _gender,
                        onChanged: (value) => {
                              setState(() {
                                _gender = value.toString();
                              })
                            },
                        value: 'Female'),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: const Text('Женский'),
                  ),
                ],
              ))
            ],
          ),
          const Label('Возраст'),
          const Input('18'),
          const Label('Хобби'),
          const Input('Выберите хобби'),
          const Label('Цена'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(child: Input('от 500 ₽')),
              SizedBox(width: 16.0),
              Expanded(child: Input('до 10 000 ₽')),
            ],
          ),
          const SizedBox(height: 2.0),
          SfRangeSliderTheme(
            data: SfRangeSliderThemeData(
              activeTrackHeight: 2,
              inactiveTrackHeight: 2,
              thumbRadius: 10,
            ),
            child: SfRangeSlider(
              stepSize: 500,
              inactiveColor: const Color.fromRGBO(204, 204, 204, 100),
              min: 500,
              max: 10000,
              values: _sfPriceValues,
              interval: 500,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              onChanged: (SfRangeValues values) {
                setState(() {
                  _sfPriceValues = values;
                });
              },
            ),
          ),
          Container(
              padding: const EdgeInsets.only(top: 150, bottom: 40),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(40)),
                child: const Text('Показать подарки'),
              ))
        ]),
      ),
    );
  }
}
