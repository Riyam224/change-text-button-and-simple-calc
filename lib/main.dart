// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

void main() {
  runApp(const CalcApp());
}

class CalcApp extends StatelessWidget {
  const CalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          drawer: const Drawer(
            backgroundColor: Color(0xff1d5790),
            child: Center(child: Text('Calc app')),
          ),
          appBar: AppBar(
            title: const Text(
              'Calc App',
              style: TextStyle(
                color: Color(0xff1d5790),
              ),
            ),
          ),
          body: const HomeView()),
    );
  }
}

// todo  home page
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // todo
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  late String result;
  Color textColor = Colors.black;

// todo dispose
  @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  // todo
  void calcNums() {
    // todo take value text  inside the controller
    final String text1 = controller1.text;
    final String text2 = controller2.text;

    // todo convert it to double
    final double num1 = double.parse(text1);
    final double num2 = double.parse(text2);

    // todo the sum
    final double sum = num1 + num2;
    setState(() {
      result = sum.toString();
    });
  }

// todo change text color

  void changeTextColor() {
    setState(() {
      textColor = const Color(0xff1d5790);
    });
  }

// todo initial result value
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result = "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Image.asset('assets/images/logo.png'),
          ),
          Center(
            child: Text('the result is ... ${result}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  // todo
                  color: textColor,
                )),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller:
                      controller1, // Attach the controller to the TextField
                  decoration: InputDecoration(
                    labelText: 'Enter first number ',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller:
                      controller2, // Attach the controller to the TextField
                  decoration: const InputDecoration(
                    labelText: 'Enter second number',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // todo button
              Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xff173c67),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      calcNums();
                    },
                    child: const Text(
                      'Sum',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // todo change color button
              Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xff173c67),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      changeTextColor();
                    },
                    child: const Text(
                      'click here',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
