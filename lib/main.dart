import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        title: "Найдем подарок каждому",
        body: "Индивидуальный подход к выбору подарка, нужно лишь указать пол, возраст и хобби",
        image: Center(
          child: SvgPicture.asset("assets/images/intro1.svg", fit: BoxFit.fill),
        ),
      ),
      PageViewModel(
        title: "Предложим более подходящие варианты",
        body: "Приложение подберет для Вас несколько вариантов подарка",
        image: Center(
          child: SvgPicture.asset("assets/images/intro2.svg", fit: BoxFit.fill),
        ),
      ),
      PageViewModel(
        title: "Создадим идеальный подарок",
        body: "В разделе статьи Вы можете найти способы упаковки и создания подарков своими руками",
        image: Center(
          child: SvgPicture.asset("assets/images/intro3.svg", fit: BoxFit.fill),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gift Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: IntroductionScreen(
          done: const Text('Вперед', style: TextStyle(color: Colors.red)),
          onDone: () {},
          onSkip: () {},
          pages: getPages(),
          next: const Text('Далее'),
          showSkipButton: true,
          skip: const Text('Пропустить'),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: Theme.of(context).colorScheme.secondary,
              color: const Color(0xffE4E4E4),
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
        ),
      ),
    );
  }
}
