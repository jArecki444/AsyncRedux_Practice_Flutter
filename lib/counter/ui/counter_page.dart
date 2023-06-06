import 'package:flutter/material.dart';

/// This is the "dumb-widget". It has no notion of the store, the state, the
/// connector or the view-model. It just gets the parameters it needs to display
/// itself, and callbacks it should call when reacting to the user interface.
class CounterPage extends StatelessWidget {
  final int? counter;
  final VoidCallback? onIncrement;

  const CounterPage({
    Key? key,
    this.counter,
    this.onIncrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AsyncRedux Increment Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text('$counter', style: const TextStyle(fontSize: 30))
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
