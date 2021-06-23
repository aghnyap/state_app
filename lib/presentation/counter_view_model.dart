import 'package:flutter/material.dart';
import 'package:state_app/domain/counter.dart';

class CounterViewModel extends ValueNotifier<int> {
  CounterViewModel({int? value}) : super(value ?? 0);

  final _counter = Counter();

  void increment() => value = _counter.increment(value);
  void reset() => value = _counter.reset();
}
