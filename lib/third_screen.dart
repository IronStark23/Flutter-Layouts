import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedShape extends StatefulWidget {
  const AnimatedShape({ Key? key }) : super(key: key);

  @override
  State<AnimatedShape> createState() => _AnimatedShapeState();
}

class _AnimatedShapeState extends State<AnimatedShape> {

  double _width = 50;
  double _height = 50;
  Color _color = Colors.blueAccent;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animation'),
        ),
        body: Center(
          child: AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius
            ),
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: 'Back',
              child: const Icon(Icons.arrow_back),
              heroTag: null,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  final random = Random();
                  _width = random.nextInt(300).toDouble();
                  _height = random.nextInt(300).toDouble();
                  _color = Color.fromRGBO(random.nextInt(256),
                      random.nextInt(256), random.nextInt(256), 0.8);
                  _borderRadius =
                      BorderRadius.circular(random.nextInt(100).toDouble());
                });
              },
              child: const Icon(Icons.change_circle),
              tooltip: 'Change the Shape',
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 0, 48, 71),
        child: Container(height: 50.0),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}