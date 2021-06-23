import 'package:state_app/domain/counter.dart';

enum CounterActions { Increment, Reset }

int counterReducer(int state, action) {
  final _counter = Counter();

  switch (action) {
    case CounterActions.Increment:
      return _counter.increment(state);
    case CounterActions.Reset:
      return _counter.reset();
    default:
      return state;
  }
}
