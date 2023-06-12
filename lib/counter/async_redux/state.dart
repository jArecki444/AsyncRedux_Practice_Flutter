class CounterState {
  final int counterValue;

  CounterState({required this.counterValue});

  CounterState copy({int? counterValue}) {
    return CounterState(counterValue: counterValue ?? this.counterValue);
  }

  static CounterState initialState() => CounterState(counterValue: 0);
}
