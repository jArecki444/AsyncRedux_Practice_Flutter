// This widget is a connector.
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import '../async_redux/vm_factory.dart';
import 'counter_page.dart';

/// It connects the store to [CounterPage] (the dumb-widget).
/// Each time the state changes, it creates a view-model, and compares it
/// with the view-model created with the previous state.
/// Only if the view-model changed, the connector rebuilds.
class CounterPageConnector extends StatelessWidget {
  const CounterPageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<int, ViewModel>(
      vm: () => Factory(this),
      builder: (BuildContext context, ViewModel vm) => CounterPage(
        counter: vm.counter,
        onIncrement: vm.onIncrement,
      ),
    );
  }
}
