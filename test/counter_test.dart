import 'package:flutter_test/flutter_test.dart';
import 'package:state_app/domain/counter.dart';

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
}
