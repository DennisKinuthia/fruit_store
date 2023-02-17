import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  State<Counter> createState() => _Counter();
}

class _Counter extends State<Counter> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  void _incrementCounter() {
    _counter.value++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[900],
        onPressed: _incrementCounter,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: const Text(
          'Counter',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
      ),
      body: Center(
        child: ValueListenableBuilder(
          builder: (context, counter, _) {
            return Text(
              '$counter',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            );
          },
          valueListenable: _counter,
        ),
      ),
    );
  }
}
