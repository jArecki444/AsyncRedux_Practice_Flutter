import 'package:flutter/foundation.dart';

/// The app state, which in this case is a counter and a description.
@immutable
class AsyncCounterState {
  final int counter;
  final String description;

  const AsyncCounterState({
    required this.counter,
    required this.description,
  });

  AsyncCounterState copy({int? counter, String? description}) =>
      AsyncCounterState(
        counter: counter ?? this.counter,
        description: description ?? this.description,
      );

  static AsyncCounterState initialState() =>
      const AsyncCounterState(counter: 0, description: "");

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AsyncCounterState &&
          runtimeType == other.runtimeType &&
          counter == other.counter &&
          description == other.description;

  @override
  int get hashCode => counter.hashCode ^ description.hashCode;
}
