import 'package:async_redux/async_redux.dart';
import 'package:asyncredux_practice_flutter/async_counter/async_redux/state.dart';
import 'package:asyncredux_practice_flutter/store/global_app_state.dart';
import 'package:http/http.dart';

/// This action increments a counter by 1, and then gets some description text.
class IncrementAndGetDescriptionAction extends ReduxAction<GlobalAppState> {
  // To make it async we simply return Future<GlobalAppState> instead of GlobalAppState.
  @override
  Future<GlobalAppState> reduce() async {
    // First, we increment the counter, synchronously.
    dispatch(IncrementAction(amount: 1));

    // Then, we start and wait for some asynchronous process.
    String fetchedDescription = await read(
        Uri.http("numbersapi.com", "${state.asyncCounterState.counter}"));

    return state.copy(
        asyncCounterState:
            state.asyncCounterState.copy(description: fetchedDescription));
  }
}

/// This action increments the counter by [amount]].
class IncrementAction extends ReduxAction<GlobalAppState> {
  final int amount;

  IncrementAction({required this.amount});

  // Synchronous reducer.
  @override
  GlobalAppState reduce() {
    return state.copy(
      asyncCounterState: state.asyncCounterState
          .copy(counter: state.asyncCounterState.counter + amount),
    );
  }
}
