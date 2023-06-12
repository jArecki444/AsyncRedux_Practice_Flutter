import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'async_counter/async_redux/state.dart';
import 'async_counter/ui/async_counter_connector.dart';
import 'counter/async_redux/state.dart';
import 'counter/ui/counter_page_connector.dart';
import 'store/global_app_state.dart';

late Store<GlobalAppState> store;

void main() {
  store = Store<GlobalAppState>(
    initialState: GlobalAppState(
      counterState: CounterState(counterValue: 0),
      asyncCounterState: const AsyncCounterState(counter: 0, description: ''),
    ),
  );
  runApp(const AsyncCounterApp()); // or runApp(const SimpleCounterApp());
}

/// This example shows a counter, a text description, and a button.
/// When the button is tapped, the counter will increment synchronously,
/// while an async process downloads some text description that relates
/// to the counter number (using the NumberAPI: http://numbersapi.com).
///
/// Note: This example uses http. It was configured to work in Android, debug mode only.
/// If you use iOS, please see:
/// https://flutter.dev/docs/release/breaking-changes/network-policy-ios-android
class AsyncCounterApp extends StatelessWidget {
  const AsyncCounterApp({super.key});

  @override
  Widget build(BuildContext context) => StoreProvider<GlobalAppState>(
        store: store,
        child: const MaterialApp(
          home: AsyncCounterPageConnector(),
        ),
      );
}

/// This example shows a counter and a button.
/// When the button is tapped, the counter will increment synchronously.
class SimpleCounterApp extends StatelessWidget {
  const SimpleCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<GlobalAppState>(
      store: store,
      child: const MaterialApp(home: CounterPageConnector()),
    );
  }
}
