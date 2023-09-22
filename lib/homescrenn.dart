import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

DateTime dateTime = DateTime.now();

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (DateTime != DateTime.now()) {
          setState(() {
            dateTime = DateTime.now();
          });
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Analog Clock',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black)),
        ),
        body: Container(
          child: Center(
            child: Transform.rotate(
              angle: pi / 2,
              child: Container(
                height: 300,
                width: 300,
                decoration:
                    BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Container(
                  height: 280,
                  width: 280,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Stack(
                    children: [
                      ...List.generate(
                        60,
                        (index) => Transform.rotate(
                          angle: index * 6 * pi / 180,
                          child: Center(
                            child: Divider(
                              color: index % 5 == 0 ? Colors.black : Colors.red,
                              indent: 260,
                              thickness: index % 5 == 0 ? 4 : 1,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Transform.rotate(
                          angle: dateTime.hour % 12 * 30 * pi / 180,
                          child: Divider(
                            color: Colors.black,
                            thickness: 6,
                            indent: 70,
                            endIndent: 115,
                          ),
                        ),
                      ),
                      Center(
                        child: Transform.rotate(
                          angle: dateTime.second % 12 * 30 * pi / 180,
                          child: Divider(
                            color: Colors.black,
                            thickness: 2,
                            indent: 30,
                            endIndent: 110,
                          ),
                        ),
                      ),
                      Center(
                        child: Transform.rotate(
                          angle: dateTime.minute % 12 * 30 * pi / 180,
                          child: Divider(
                            color: Colors.black,
                            thickness: 4,
                            indent: 50,
                            endIndent: 110,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
