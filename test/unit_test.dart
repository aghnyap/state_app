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
    test('should increment counter value', () {
      final counterViewModel = CounterViewModel();
      counterViewModel.addListener(() {
        expect(counterViewModel.count, 1);
      });
      counterViewModel.increment();
    });

    test('should reset value', () {
      final counterViewModel = CounterViewModel();
      counterViewModel.addListener(() {
        expect(counterViewModel.count, 0);
      });
      counterViewModel.reset();
    });
  });
}
