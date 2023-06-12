// This widget is a connector.
import 'package:async_redux/async_redux.dart';
import 'package:asyncredux_practice_flutter/counter/async_redux/action_reducer.dart';
import 'package:asyncredux_practice_flutter/store/global_app_state.dart';
import 'package:flutter/material.dart';

import 'counter_page.dart';

/// It connects the store to [CounterPage] (the dumb-widget).
/// Each time the state changes, it creates a view-model, and compares it
/// with the view-model created with the previous state.
/// Only if the view-model changed, the connector rebuilds.
class CounterPageConnector extends StatelessWidget {
  const CounterPageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalAppState, _ViewModel>(
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel vm) => CounterPage(
        counter: vm.counter,
        onIncrement: () => onIncrement(context),
      ),
    );
  }

  void onIncrement(BuildContext context) {
    StoreProvider.dispatch(context, IncrementAction(amount: 1));
  }
}

/// The view-model holds the part of the Store state the dumb-widget needs.
class _ViewModel extends Vm {
  final int counter;

  _ViewModel({
    required this.counter,
  }) : super(equals: [counter]);

  static _ViewModel fromStore(Store<GlobalAppState> store) => _ViewModel(
        counter: store.state.counterState.counterValue,
      );
}
