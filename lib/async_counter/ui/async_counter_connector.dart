import 'package:async_redux/async_redux.dart';
import 'package:asyncredux_practice_flutter/async_counter/ui/async_counter_page.dart';
import 'package:flutter/material.dart';

import '../../store/global_app_state.dart';
import '../async_redux/action_reducer.dart';

// This widget is a connector. It connects the store to "dumb-widget".
class AsyncCounterPageConnector extends StatelessWidget {
  const AsyncCounterPageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalAppState, _ViewModel>(
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel vm) {
        return AsyncCounterPage(
          counter: vm.counter,
          description: vm.description,
          onIncrement: () => onIncrement(context),
        );
      },
    );
  }

  void onIncrement(BuildContext context) {
    StoreProvider.dispatch(context, IncrementAndGetDescriptionAction());
  }
}

/// The view-model holds the part of the Store state the dumb-widget needs.
class _ViewModel extends Vm {
  final int counter;
  final String description;

  _ViewModel({
    required this.counter,
    required this.description,
  }) : super(equals: [counter, description]);

  static _ViewModel fromStore(Store<GlobalAppState> store) => _ViewModel(
        counter: store.state.asyncCounterState.counter,
        description: store.state.asyncCounterState.description,
      );
}
