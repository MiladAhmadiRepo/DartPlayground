import 'package:flutter/material.dart';
  import 'dart:developer' as devtools show log;

  extension Log on Object{
    void log()=> devtools.log(toString());
  }
void main() {
  runApp(const MyApp());
}
abstract class CanRun{
    void run ();
    void sit (){
      "implemented function in abstract class cannot called without use ((super key word)) in child class".log();
    }
}
abstract class CanWalk{
    void walk ();
}
//1- todo you can extend from one class on the other hand you can use ((with)) key word to use many class functions
class Cat extends CanRun{
  @override
  void run() {
    "Cat can run - sub class".log();
  }
}

class Dog with CanRun,CanWalk{
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
    //2- todo implemented function in abstract class cannot called out of class unless use ((super key word)) in child class
    super.sit();
    "now you can call sit method in Dog and CanRun class".log();
  }

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    "start log".log();
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

    void testAbstractClass(){
      final cat=Cat();
      cat.run();
      "-----------------------------".log();
      final dog=Dog();
      dog.sit();
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
