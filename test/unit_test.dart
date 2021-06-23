import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_app/domain/counter.dart';
import 'package:state_app/presentation/counter_view_model.dart';

void main() {
  group('Counter', () {
    final counter = Counter();

    test('value should be incremented', () {
      expect(counter.increment(0), 1);
    });

    test('value shold be reset', () {
      counter.increment(0);
      expect(counter.reset(), 0);
    });
  });

  group('CounterViewModel', () {
    blocTest<CounterViewModel, int>(
      'should increment counter value',
      build: () => CounterViewModel(),
      act: (viewModel) => viewModel.increment(),
      expect: () => [1],
    );

    blocTest<CounterViewModel, int>(
      'should reset counter value',
      build: () => CounterViewModel(),
      seed: () => 1,
      act: (viewModel) => viewModel.reset(),
      expect: () => [0],
    );
  });
}
