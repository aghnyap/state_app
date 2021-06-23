import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_app/domain/counter.dart';

class CounterViewModel extends Cubit<int> {
  CounterViewModel({int? initialState}) : super(initialState ?? 0);

  final _counter = Counter();

  void increment() => emit(_counter.increment(state));
  void reset() => emit(_counter.reset());
}
