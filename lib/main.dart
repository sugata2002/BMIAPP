import 'dart:math';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _bmi = 0;
  var _height = .0;
  var _weigh = 0;
  var _age = 24;
  final GlobalKey<SlideActionState> _key = GlobalKey();
  void showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  double calculateBMI(int weight, double hight) {
    var hightM = hight / 100;
    double bmi = weight / pow(hightM, 2);
    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Row containing the two images
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    BorderRadius.circular(25);
                    showSnackBar("you selected male");
                  },
                  child: Container(
                    width: 100,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 9,
                          color: Colors.grey,
                          spreadRadius: 2,
                          offset: Offset(0, 1),
                        )
                      ],
                    ),
                    child: Image.asset('assets/images/3233508.png'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showSnackBar("You selected female");
                  },
                  child: Container(
                    width: 100,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 9,
                          color: Colors.grey,
                          spreadRadius: 2,
                          offset: Offset(0, 1),
                        )
                      ],
                    ),
                    child: Image.asset('assets/images/femal.png'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 90,
              width: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Hight ${_height.toStringAsFixed(2)} CM"),
                  Slider(
                    value: _height,
                    activeColor: Colors.black54,
                    label: _height.toStringAsFixed(2),
                    onChanged: (value) {
                      setState(() {
                        _height = value;
                      });
                    },
                    min: 0.0,
                    max: 272.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120,
              // child: Padding(
              //   padding: EdgeInsets.only(bottom: 200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      color: Colors.grey.shade200,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5.0,
                          spreadRadius: 0.1,
                          offset: Offset(0, 0),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          const Text(
                            "WEIGHT",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 23),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _weigh -= 1;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.remove_circle_outline_rounded,
                                      size: 30,
                                    )),
                                Text(_weigh.toString(),
                                    style: const TextStyle(fontSize: 20)),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _weigh += 1;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.add_circle_outline_rounded,
                                      size: 30,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 130,
                    width: 130,
                    // color: Colors.grey.shade300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: Colors.grey.shade200,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5.0,
                            spreadRadius: 0.1,
                            offset: Offset(0, 0),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Column(
                        children: [
                          const Text(
                            "AGE",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 23),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _age -= 1;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.remove_circle_outline_rounded,
                                        size: 30,
                                      )),
                                  Text(_age.toString(),
                                      style: const TextStyle(fontSize: 20)),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _age += 1;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.add_circle_outline_rounded,
                                        size: 30,
                                      )),
                                ],
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            // ),

            SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("YOUR AGE IS "),
                Text(_age.toString()),
                const Text(" AND YOUR BMI IS "),
                Text(_bmi.toStringAsFixed(2)),

              ],
            )),

            SizedBox(
              width: 500,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  child: SlideAction(
                      key: _key,
                      height: 60,
                      sliderButtonIconSize: 15,
                      sliderRotate: false,
                      onSubmit: () async {
                        await Future.delayed(const Duration(seconds: 1));
                        var bmi =
                            calculateBMI(_weigh.toInt(), _height.toDouble());
                        setState(() {
                          _bmi = bmi;
                        });
                        // print("${bmi.toStringAsFixed(2)}");
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
