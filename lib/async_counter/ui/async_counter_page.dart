import 'package:flutter/material.dart';

class AsyncCounterPage extends StatelessWidget {
  final int? counter;
  final String? description;
  final VoidCallback? onIncrement;

  AsyncCounterPage({
    Key? key,
    this.counter,
    this.description,
    this.onIncrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Async Counter Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text('$counter', style: const TextStyle(fontSize: 30)),
            Text(description!,
                style: const TextStyle(fontSize: 15),
                textAlign: TextAlign.center),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onIncrement,
        child: const Icon(Icons.add),
      ),
    );
  }
}
