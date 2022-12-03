import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

void main() {
  runApp(const MyApp());
}

abstract class CanRun {
  void run();

  void sit() {
    "implemented function in abstract class cannot called without use ((super key word)) in child class"
        .log();
  }
}

abstract class CanWalk {
  void walk();
}

//1- todo you can just extend from one class with ((extends)) key word .on the other hand you can use ((with)) key word to use many class's functions
class Cat extends CanRun {
  @override
  void run() {
    "Cat can run - sub class".log();
  }
}

class Dog with CanRun, CanWalk {
  @override
  void run() {
    "Dog can run - sub class".log();
  }

  @override
  void walk() {
    "Dog can walk - sub class".log();
  }

  @override
  void sit() {
    //2- todo- implemented function in abstract class could not call out of
    //todo- baseclass unless use ((super key word)) in child class
    super.sit();
    "now you can call sit method in Dog and CanRun class".log();
  }
}

abstract class Vehicle{
  @mustCallSuper
  void speed(){
    "any vehicle has speed ".log();
  }
}

class BMW extends Vehicle{
  @override
  void speed(){
    //3- todo you can force the implementer of abstract class to call super methods with ((@mustCallSuper)) notifier
    super.speed();

  }
}

enum LiquidType{
  Water,Cola
}
abstract class Liquid{
  final LiquidType type;
  Liquid({required this.type});
}
//4- todo you can use ((constractor)) in abstract class
class Water extends Liquid{
  Water():super(type: LiquidType.Cola);
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  void testAbstractClass() {
    final cat = Cat();
    cat.run();
    "-----------------------------".log();
    final dog = Dog();
    dog.sit();
    "-----------------------------".log();
    final water=Water();
    water.type.log();
  }

  @override
  Widget build(BuildContext context) {
    testAbstractClass();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
