import 'package:async_redux/async_redux.dart';
import 'package:asyncredux_practice_flutter/store/global_app_state.dart';

/// This action increments the counter by [amount]].
class IncrementAction extends ReduxAction<GlobalAppState> {
  final int amount;

  IncrementAction({required this.amount});

  @override
  GlobalAppState reduce() => state.copy(
        counterState: state.counterState
            .copy(counterValue: state.counterState.counterValue + amount),
      );
}
