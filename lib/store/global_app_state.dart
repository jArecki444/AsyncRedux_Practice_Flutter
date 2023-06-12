import '../async_counter/async_redux/state.dart';
import '../counter/async_redux/state.dart';

class GlobalAppState {
  final CounterState counterState;
  final AsyncCounterState asyncCounterState;

  GlobalAppState({
    required this.counterState,
    required this.asyncCounterState,
  });

  GlobalAppState copy({
    CounterState? counterState,
    AsyncCounterState? asyncCounterState,
  }) {
    return GlobalAppState(
      counterState: counterState ?? this.counterState,
      asyncCounterState: asyncCounterState ?? this.asyncCounterState,
    );
  }
}
